import 'package:YoutubeExtract/lib/model/Extensions.dart';
import 'package:YoutubeExtract/lib/model/formats/AudioFormat.dart';
import 'package:YoutubeExtract/lib/model/itag.dart';

abstract class Format {
  String AUDIO = "audio";
  String VIDEO = "video";
  String AUDIO_VIDEO = "audio/video";

  var itag;
  int tag;
  String url;
  String mimeType;
  Extensions extensions;
  var bitrate;
  var contentLength;
  var lastModified;
  var approxDurationMs;

  Format(var json) {
    tag = json["itag"];
    itag = Itag.valueOf(tag);

    url = json["url"] ?? null;
    //url.replaceAll("\\u0026", "&") ?? null;
    
    mimeType = json["mimeType"];
    bitrate = json["bitrate"];
    contentLength = json["contentLength"];
    lastModified = json["lastModified"];
    approxDurationMs = json["approxDurationMs"];

    if (mimeType == null || mimeType.isEmpty) {
      extensions = Extensions.UNKNOWN;
    } else if (mimeType.contains(Extensions.MPEG4.value())) {
      if (this is AudioFormat)
        extensions = Extensions.M4A;
      else
        extensions = Extensions.MPEG4;
    } else if (mimeType.contains(Extensions.WEBM.value())) {
      if (this is AudioFormat)
        extensions = Extensions.WEBA;
      else
        extensions = Extensions.WEBM;
    } else if (mimeType.contains(Extensions.FLV.value())) {
      extensions = Extensions.FLV;
    } else if (mimeType.contains(Extensions.GP3.value())) {
      extensions = Extensions.GP3;
    } else {
      extensions = Extensions.UNKNOWN;
    }
  }

  String typeoff();
  int tagf() {
    return tag;
  }

  Itag itagf() {
    return itag;
  }

  bitratef() {
    return bitrate;
  }

  String mimeTypef() {
    return mimeType;
  }

  String urlf() {
    return url;
  }

  contentLengthf() {
    return contentLength;
  }

  lastModifiedf() {
    return lastModified;
  }

  durationf() {
    return approxDurationMs;
  }

  Extensions extensionsf() {
    return extensions;
  }
}
