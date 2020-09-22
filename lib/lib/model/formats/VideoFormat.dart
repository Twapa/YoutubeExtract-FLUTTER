import 'package:YoutubeExtract/lib/model/Extensions.dart';
import 'package:YoutubeExtract/lib/model/formats/Format.dart';
import 'package:YoutubeExtract/lib/model/quality/enums.dart';

class VideoFormat extends Format {
  var fps;
  String qualityLabel;
  //var width;
//var height;
  VideoQuality videoQuality;

  VideoFormat(var json) : super(json) {
    fps = json["fps"];
    qualityLabel = json["qualityLabel"];

    //String split = json["size"] ?? null;
    //var splitted = split?.split("x");
   // width = splitted[0] ?? 0;

//height = splitted[1] ?? 0;

    videoQuality = VideoQualityE.valueOf(json["quality"]);
  }

  int fpsf() {
    return fps;
  }

  VideoQuality videoQualityf() {
    return videoQuality != null ? videoQuality : itag.videoQuality();
  }

  qualityLabelf() {
    return qualityLabel;
  }

  

  @override
  String typeoff() {
   return VIDEO;
  }
}
