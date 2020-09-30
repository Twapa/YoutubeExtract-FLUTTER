import 'package:YoutubeExtract/lib/cipher/CipherInterface.dart';
import 'package:YoutubeExtract/lib/cipher/JsFunction.dart';

class DefaultCipher implements Cipher {
  Map<String, CipherFunction> functionsMap;
  List<JsFunction> functions;

  DefaultCipher(List<JsFunction> transformFunctions,
      Map<String, CipherFunction> transformFunctionsMap) {
    this.functionsMap = transformFunctionsMap;
    this.functions = transformFunctions;
  }

  @override
  String getSignature(String cipheredSignature) {
    var signature = cipheredSignature.runes;
    for (JsFunction jsFunction in functions) {
      signature = functionsMap[jsFunction.getName()]
          .apply(signature, jsFunction.getArgument());
    }

    return String.fromCharCodes(signature);
  }
}
