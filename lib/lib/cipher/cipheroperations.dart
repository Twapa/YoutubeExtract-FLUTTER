import 'package:YoutubeExtract/lib/cipher/CipherInterface.dart';

class ReverseFunction implements CipherFunction {
  @override
  apply(Runes array, String argument) {
    // StringBuilder sb = new StringBuilder().append(array);

    //  return sb.reverse().toString().toCharArray();

    return array.toList().reversed;
  }
}

class SwapFunctionV1 implements CipherFunction {
  @override
  apply(Runes array, String argument) {

    int position = int.parse(argument);
    var arrays = array.toList();
    var c = arrays[0];
    arrays[0] = arrays[position % arrays.length];
    arrays[position] = c;
    return arrays;
  }
}

class SwapFunctionV2 implements CipherFunction {
  @override
  apply(Runes array, String argument) {
    var arrays = array.toList();

    int position = int.parse(argument);
    var c = arrays[0];
    arrays[0] = arrays[position % arrays.length];
    arrays[position % arrays.length] = c;
    return arrays;
  }
}

class SpliceFunction implements CipherFunction {
  @override
  apply(Runes array, String argument) {
    var arrays = array.toList();
    int deleteCount = int.parse(argument);
    var spliced = new List(arrays.length - deleteCount);
    
    //  System.arraycopy(array, 0, spliced, 0, deleteCount);
    // System.arraycopy(array, deleteCount * 2, spliced, deleteCount, spliced.length - deleteCount);

    return spliced;
  }
}
