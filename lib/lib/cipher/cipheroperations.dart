import 'package:YoutubeExtract/lib/cipher/CipherInterface.dart';

class ReverseFunction implements CipherFunction {

    @override
      apply(List array, String argument) {
       // StringBuilder sb = new StringBuilder().append(array);
      //  return sb.reverse().toString().toCharArray();
    }

}

class SwapFunctionV1 implements CipherFunction {

    @override
      apply(List array, String argument) {
        int position = int.parse(argument);
        var c = array[0];
        array[0] = array[position % array.length];
        array[position] = c;
        return array;
    }

}


class SwapFunctionV2 implements CipherFunction {

    @override
      apply(List array, String argument) {
        int position = int.parse(argument);
        var c = array[0];
        array[0] = array[position % array.length];
        array[position % array.length] = c;
        return array;
    }

}

class SpliceFunction implements CipherFunction {

    @override
      apply(List array, String argument) {
        int deleteCount = int.parse(argument);
        var spliced = new List(array.length - deleteCount);
      //  System.arraycopy(array, 0, spliced, 0, deleteCount);
       // System.arraycopy(array, deleteCount * 2, spliced, deleteCount, spliced.length - deleteCount);

        return spliced;
    }

}