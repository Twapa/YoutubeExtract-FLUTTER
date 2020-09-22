import 'package:YoutubeExtract/lib/cipher/CipherInterface.dart';
import 'package:YoutubeExtract/lib/cipher/DefaultCipher.dart';
import 'package:YoutubeExtract/lib/cipher/JsFunction.dart';
import 'package:YoutubeExtract/lib/cipher/cipheroperations.dart';
import 'package:YoutubeExtract/lib/extractor/DefaultExtractor.dart';
import 'package:YoutubeExtract/lib/extractor/Extractor.dart';

import 'package:http/http.dart' as http;

class CachedCipherFactory implements CipherFactory {
 
 static Set<String> INITIAL_FUNCTION_PATTERNS = {
            r"\b[cs]\s*&&\s*[adf]\.set\([^,]+\s*,\s*encodeURIComponent\s*\(\s*([a-zA-Z0-9$]+)\(",

            r"\b[a-zA-Z0-9]+\s*&&\s*[a-zA-Z0-9]+\.set\([^,]+\s*,\s*encodeURIComponent\s*\(\s*([a-zA-Z0-9$]+)\(",

            r"(?:\b|[^a-zA-Z0-9$])([a-zA-Z0-9$]{2})\s*=\s*function\(\s*a\s*\)\s*\{\s*a\s*=\s*a\.split\(\s*\'\'\s*\)",
            r"([a-zA-Z0-9$]+)\s*=\s*function\(\s*a\s*\)\s*\{\s*a\s*=\s*a\.split\(\s*\'\'\s*\)",
            r"([\''])signature\1\s*,\s*([a-zA-Z0-9$]+)\(",

            r"\.sig\|\|([a-zA-Z0-9$]+)\(",
            r"yt\.akamaized\.net/\)\s*\|\|\s*.*?\s*[cs]\s*&&\s*[adf]\.set\([^,]+\s*,\s*(?:encodeURIComponent\s*\()?\s*()$",
            r"\b[cs]\s*&&\s*[adf]\.set\([^,]+\s*,\s*([a-zA-Z0-9$]+)\(",
            r"\b[a-zA-Z0-9]+\s*&&\s*[a-zA-Z0-9]+\.set\([^,]+\s*,\s*([a-zA-Z0-9$]+)\(",
            r"\bc\s*&&\s*a\.set\([^,]+\s*,\s*\([^)]*\)\s*\(\s*([a-zA-Z0-9$]+)\(",
            r"\bc\s*&&\s*[a-zA-Z0-9]+\.set\([^,]+\s*,\s*\([^)]*\)\s*\(\s*([a-zA-Z0-9$]+)\("
    };


     static String FUNCTION_REVERSE_PATTERN = r"\{\w\.reverse\(\)\}";
     static String FUNCTION_SPLICE_PATTERN = r"\{\w\.splice\(0,\w\)\}";
     static String FUNCTION_SWAP1_PATTERN = r"\{var\s\w=\w\[0];\w\[0]=\w\[\w%\w.length];\w\[\w]=\w\}";
     static String FUNCTION_SWAP2_PATTERN = r"\{var\s\w=\w\[0];\w\[0]=\w\[\w%\w.length];\w\[\w%\w.length]=\w\}";

      RegExp JS_FUNCTION_PATTERN = RegExp(r"\w+\.(\w+)\(\w,(\d+)\)");



   Extractor extractor;

   List<Pattern> knownInitialFunctionPatterns = [];
  Map<Pattern, CipherFunction> functionsEquivalentMap = {};
  Map<String, Cipher> ciphers = {};

   CachedCipherFactory(Extractor extractor) {
        this.extractor = extractor;

        for (String pattern in INITIAL_FUNCTION_PATTERNS) {
            addInitialFunctionPattern(knownInitialFunctionPatterns.length, pattern);
        }

        addFunctionEquivalent(FUNCTION_REVERSE_PATTERN, new ReverseFunction());
        addFunctionEquivalent(FUNCTION_SPLICE_PATTERN, new SpliceFunction());
        addFunctionEquivalent(FUNCTION_SWAP1_PATTERN, new SwapFunctionV1());
        addFunctionEquivalent(FUNCTION_SWAP2_PATTERN, new SwapFunctionV2());
    }

     addInitialFunctionPattern(int priority, String regex) {
        knownInitialFunctionPatterns.add( RegExp(regex));
    }


    
     addFunctionEquivalent(String regex, CipherFunction function) {
        functionsEquivalentMap[RegExp(regex)] = function;
        
    }




  @override
     Future<Cipher> createCipher(var jsUrl) async {

        Cipher cipher = ciphers[jsUrl];

        if (cipher == null) {

            String js =await extractor.loadUrl(jsUrl);


            List<JsFunction> transformFunctions = getTransformFunctions(js);
            
            String va = transformFunctions.elementAt(0).getVar();

            Map<String, CipherFunction> transformFunctionsMap = getTransformFunctionsMap(va, js);

            cipher = new DefaultCipher(transformFunctions, transformFunctionsMap);

            ciphers[jsUrl]=cipher;
        }

        return cipher;
    }




     List<JsFunction> getTransformFunctions(String js) {

        String name = getInitialFunctionName(js).replaceAll(r"[^$A-Za-z0-9_]", "");

        RegExp pattern = RegExp(name + "=function\\(\\w\\)\\{[a-z=\\.\\(\\\"\\)]*;(.*);(?:.+)\\}");

        var split = pattern.firstMatch(js).group(1).split(';');
        
            
            List<JsFunction> jsFunctions = [];
            for (String jsFunction in split) {
                String funVar = jsFunction.split("\\.")[0];

                List parsedFunction = parseFunction(jsFunction);
                String funName = parsedFunction[0];
                String funArgument = parsedFunction[1];

                jsFunctions.add(new JsFunction(funVar, funName, funArgument));
            }
            return jsFunctions;
        

        
    }



     String getInitialFunctionName(String js) {
        for (RegExp pattern in knownInitialFunctionPatterns) {

            var matcher = pattern.firstMatch(js).group(1);
            
            return matcher;
        }

     
    }

      parseFunction(String jsFunction)  {

        var matcher = JS_FUNCTION_PATTERN.firstMatch(jsFunction);

        List nameAndArgument = List(2);
        
            nameAndArgument[0] = matcher.group(1);
            nameAndArgument[1] = matcher.group(2);
            return nameAndArgument;
        }




       Map<String, CipherFunction> getTransformFunctionsMap(String va, String js)  {
        List transformObject = getTransformObject(va, js);
        Map<String, CipherFunction> mapper = {};

        for (String obj in transformObject) {

            List split = obj.split(":");
            String name = split[0];
            String jsFunction = split[1];

            CipherFunction function = mapFunction(jsFunction);
            mapper[name]= function;
        }
        return mapper;
    }


     getTransformObject(String va, String js) {
        va = va.replaceAll(r"[^$A-Za-z0-9_]", "");
        
        RegExp pattern = RegExp("var %s=\\{(.*?)\\};" + va);
        var matcher = pattern.firstMatch(js);
        
        
            return matcher.group(1).replaceAll("\n", " ").split(", ");
        

  
    }

     CipherFunction mapFunction(String jsFunction) {
       
        for (MapEntry<RegExp, CipherFunction> entry in functionsEquivalentMap.entries) {
          
            var matcher = entry.key?.firstMatch(jsFunction);
           
                return entry?.value;
            }
        }

        
    }
       
   

  

