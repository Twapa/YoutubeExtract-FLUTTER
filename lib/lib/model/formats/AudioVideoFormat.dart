import 'package:YoutubeExtract/lib/model/formats/Format.dart';
import 'package:YoutubeExtract/lib/model/quality/enums.dart';
import 'package:YoutubeExtract/lib/model/Extensions.dart';

class AudioVideoFormat extends Format {
  var _averageBitrate;
  var _audioSampleRate;
  AudioQuality _audioQuality;
  var _qualityLabel;
  int _width;
  int _height;
  VideoQuality _videoQuality;

  AudioVideoFormat(var json) : super(json) {
    
    _audioSampleRate = json["audioSampleRate"];
    _averageBitrate = json["averageBitrate"];
    _qualityLabel = json["qualityLabel"];
    _width = json["width"];
    _height = json["height"];

    _videoQuality = VideoQualityE.valueOf(json['quality']) ;

    var split = (json["audioQuality"]) ?? '';
    var splitted = split.split('_');

    String quality = splitted[splitted.length - 1].toLowerCase() ?? null;

    _audioQuality = AudioQualityE.valueOf(quality);
  }

  

  VideoQuality get videoQuality =>
      _videoQuality != null ? _videoQuality : itag.videoQuality();

  String qualityLabel() => _qualityLabel;

  int width() => _width;

  int height() {
    return _height;
  }

  int averageBitrate() {
    return _averageBitrate;
  }

  AudioQuality audioQuality() {
    return _audioQuality != null ? _audioQuality : itag.audioQuality();
  }

  int audioSampleRate() {
    return _audioSampleRate;
  }



  @override
  String type() {
    return '$_audioQuality';
    
  }

  @override
  String typeoff() {
    
    return AUDIO_VIDEO;
  }
}
