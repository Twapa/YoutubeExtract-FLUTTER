 import 'package:YoutubeExtract/lib/model/Extensions.dart';
import 'package:YoutubeExtract/lib/model/formats/Format.dart';
import 'package:YoutubeExtract/lib/model/quality/enums.dart';

class AudioFormat extends Format {

    var averageBitrate;
    var audioSampleRate;
    AudioQuality audioQuality;

     AudioFormat(var json) : super(json) {
       
        audioSampleRate = json["audioSampleRate"];
        averageBitrate = json["averageBitrate"];
        var split = (json["audioQuality"]) ?? '';
       var splitted = split.split('_');
    

       String quality = splitted[splitted.length - 1].toLowerCase() ?? null;
       audioQuality = AudioQualityE.valueOf(quality);

        
    }

    
    int averageBitratef() {
        return averageBitrate;
    }

   AudioQuality audioQualityf() {
        return audioQuality != null ? audioQuality : itag.audioQuality();
    }

    int audioSampleRatef() {
        return audioSampleRate;
    }

  

  @override
  String typeoff() {

    return AUDIO;
  }
}