import 'package:YoutubeExtract/lib/model/quality/enums.dart';

class Extensions {
  String _value;
  Extensions(this._value);

  // video
  static final Extensions MPEG4 = Extensions("mp4");
  static final Extensions WEBM = Extensions("webm");
  static final Extensions GP3 = Extensions("3gp");
  static final Extensions FLV = Extensions("flv");
  // auio
  static final Extensions M4A = Extensions("m4a");
  static final Extensions WEBA = Extensions("weba");
  // sutitles
  static final Extensions JSON3 = Extensions("json3");
  static final Extensions SUBRIP = Extensions("srt");
  static final Extensions TRANSCRIPT_V1 = Extensions("srv1");
  static final Extensions TRANSCRIPT_V2 = Extensions("srv2");
  static final Extensions TRANSCRIPT_V3 = Extensions("srv3");
  static final Extensions TTML = Extensions("ttml");
  static final Extensions WEBVTT = Extensions("vtt");

  // other
  static final Extensions UNKNOWN = new Extensions("unknown");

  String value() => _value;

  bool isAudio() {
    return Extensions.M4A == M4A || Extensions.WEBM == WEBM;
  }

  bool isVideo() {
    return Extensions.MPEG4 == MPEG4 ||
        Extensions.WEBM == WEBM ||
        Extensions.GP3 == GP3 ||
        Extensions.FLV == FLV;
  }

  // bool isSubtitle() {
  //   return Extensions.equals(SUBRIP) ||
  //       this.equals(TRANSCRIPT_V1) ||
  //       this.equals(TRANSCRIPT_V2) ||
  //       this.equals(TRANSCRIPT_V3) ||
  //       this.equals(TTML) ||
  //       this.equals(WEBVTT) ||
  //       this.equals(JSON3);
  // }
}

extension string on String {
  bool isEmpty() {
    return this.length == 0;
  }
}

extension VideoQualityE on VideoQuality {
  static VideoQuality valueOf(String s) {
    for (var item in VideoQuality.values) {
      final ts = item.toString();
      if (ts.substring(ts.indexOf('.') + 1) == s) {
        return item;
      }
    }
    throw ArgumentError('$s is not a valid Time value');
  }
}

extension AudioQualityE on AudioQuality {
  static AudioQuality valueOf(String s) {
    if (s.isNotEmpty) {
      for (var item in AudioQuality.values) {
        final ts = item.toString();
        if (ts.substring(ts.indexOf('.') + 1) == s) {
          return item;
        }
      }
    }

    return null;

    //throw ArgumentError('  invalid s value');
  }
}
