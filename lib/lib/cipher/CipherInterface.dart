 
  abstract class Cipher{

    String getSignature(String cipheredSignature);
}

abstract class CipherFactory {

   
   createCipher(var jsUrl);

    addInitialFunctionPattern(int priority, String regex);

     addFunctionEquivalent(String regex, CipherFunction function);
}

abstract class CipherFunction {

     apply(Runes array, String argument);
}