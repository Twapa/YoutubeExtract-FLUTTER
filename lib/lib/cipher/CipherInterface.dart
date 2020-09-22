 
  abstract class Cipher{

    String getSignature(String cipheredSignature);
}

abstract class CipherFactory {


   createCipher(var jsUrl);

   // void addInitialFunctionPattern(int priority, var regex);

    //void addFunctionEquivalent(String regex, CipherFunction function);
}

abstract class CipherFunction {

     apply(List array, String argument);
}