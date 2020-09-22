import 'package:YoutubeExtract/lib/model/quality/enums.dart';
import 'package:YoutubeExtract/lib/model/type.dart';




class Itag {
  // unknown {
  //     @Override
  //     public void setId(int id) {
  //         this.id = id;
  //     }
  // },

  static Map<int, type> itagMap = {
    5: type(videoQ: VideoQuality.small, audioQ: AudioQuality.low),
    6: type(videoQ: VideoQuality.small, audioQ: AudioQuality.low),
    13: type(videoQ: VideoQuality.unknown, audioQ: AudioQuality.low),
    17: type(videoQ: VideoQuality.tiny, audioQ: AudioQuality.low),
    18: type(videoQ: VideoQuality.medium, audioQ: AudioQuality.low),
    22: type(videoQ: VideoQuality.hd720, audioQ: AudioQuality.medium),

    34: type(videoQ: VideoQuality.medium, audioQ: AudioQuality.medium),
    35: type(videoQ: VideoQuality.large, audioQ: AudioQuality.medium),
    36: type(videoQ: VideoQuality.tiny, audioQ: AudioQuality.unknown),
    37: type(videoQ: VideoQuality.hd1080, audioQ: AudioQuality.medium),
    38: type(videoQ: VideoQuality.highres, audioQ: AudioQuality.medium),

    43: type(videoQ: VideoQuality.medium, audioQ: AudioQuality.medium),
    44: type(videoQ: VideoQuality.large, audioQ: AudioQuality.medium),
    45: type(videoQ: VideoQuality.hd720, audioQ: AudioQuality.medium),
    46: type(videoQ: VideoQuality.hd1080, audioQ: AudioQuality.medium),

    // 3D videos
    82:type(videoQ: VideoQuality.medium,audioQ: AudioQuality.medium,b: true),
    83:type(videoQ: VideoQuality.large, audioQ:AudioQuality.medium, b:true),
    84:type(videoQ: VideoQuality.hd720, audioQ:AudioQuality.medium, b:true),
    85:type(videoQ: VideoQuality.hd1080,audioQ: AudioQuality.medium,b: true),
   100:type(videoQ: VideoQuality.medium,audioQ: AudioQuality.medium,b: true),
   101:type(videoQ: VideoQuality.large, audioQ:AudioQuality.medium, b:true),
   102:type(videoQ: VideoQuality.hd720, audioQ:AudioQuality.medium, b:true),

    // // Apple HTTP Live Streaming
    91:type(videoQ:VideoQuality.tiny,   audioQ:AudioQuality.low),
    92:type(videoQ:VideoQuality.small,  audioQ:AudioQuality.low),
    93:type(videoQ:VideoQuality.medium, audioQ:AudioQuality.medium),
    94:type(videoQ:VideoQuality.large,  audioQ:AudioQuality.medium),
    95:type(videoQ:VideoQuality.hd720,  audioQ:AudioQuality.high),
    96:type(videoQ:VideoQuality.hd1080, audioQ:AudioQuality.high),
    132:type(videoQ:VideoQuality.small, audioQ:  AudioQuality.low),
    151:type(videoQ:VideoQuality.tiny,  audioQ:AudioQuality.low), 

    // // DASH mp4 video
    133: type(videoQ: VideoQuality.small),
    134: type(videoQ: VideoQuality.medium),
    135: type(videoQ: VideoQuality.large),
    136: type(videoQ: VideoQuality.hd720),
    137: type(videoQ: VideoQuality.hd1080),
    138: type(videoQ: VideoQuality.hd2160),
    160: type(videoQ: VideoQuality.tiny),
    212: type(videoQ: VideoQuality.large),
    264: type(videoQ: VideoQuality.hd1440),
    266: type(videoQ: VideoQuality.hd2160),
    298: type(videoQ: VideoQuality.hd720),
    299: type(videoQ: VideoQuality.hd1080),

    // // DASH mp4 audio
    139: type(audioQ: AudioQuality.low),
    140: type(audioQ: AudioQuality.medium),
    141: type(audioQ: AudioQuality.high),
    256: type(audioQ: AudioQuality.unknown),
    325: type(audioQ: AudioQuality.unknown),
    328: type(audioQ: AudioQuality.unknown),

    // // DASH webm video
    167: type(videoQ: VideoQuality.medium),
    168: type(videoQ: VideoQuality.large),
    169: type(videoQ: VideoQuality.hd720),
    170: type(videoQ: VideoQuality.hd1080),
    218: type(videoQ: VideoQuality.large),
    219: type(videoQ: VideoQuality.tiny),
    242: type(videoQ: VideoQuality.small),
    243: type(videoQ: VideoQuality.medium),
    244: type(videoQ: VideoQuality.large),
    245: type(videoQ: VideoQuality.large),
    246: type(videoQ: VideoQuality.large),
    247: type(videoQ: VideoQuality.hd720),
    248: type(videoQ: VideoQuality.hd1080),
    271: type(videoQ: VideoQuality.hd1440),
    272: type(videoQ: VideoQuality.highres),
    278: type(videoQ: VideoQuality.tiny),
    302: type(videoQ: VideoQuality.hd720),
    303: type(videoQ: VideoQuality.hd1080),
    308: type(videoQ: VideoQuality.hd1440),
    313: type(videoQ: VideoQuality.hd2160),
    315: type(videoQ: VideoQuality.hd2160),

    // // DASH webm audio
    171: type(audioQ: AudioQuality.medium),
    172: type(audioQ: AudioQuality.high),

    // // Dash webm audio with opus inside
    249: type(audioQ: AudioQuality.low),
    250: type(audioQ: AudioQuality.low),
    251: type(audioQ: AudioQuality.medium),

    // // Dash webm hdr video
    330: type(videoQ: VideoQuality.tiny),
    331: type(videoQ: VideoQuality.small),
    332: type(videoQ: VideoQuality.medium),
    333: type(videoQ: VideoQuality.large),
    334: type(videoQ: VideoQuality.hd720),
    335: type(videoQ: VideoQuality.hd1080),
    336: type(videoQ: VideoQuality.hd1440),
    337: type(videoQ: VideoQuality.hd2160),

    // // av01 video only formats
    394: type(videoQ: VideoQuality.tiny),
    395: type(videoQ: VideoQuality.small),
    396: type(videoQ: VideoQuality.medium),
    397: type(videoQ: VideoQuality.large),
    398: type(videoQ: VideoQuality.hd720),
    399: type(videoQ: VideoQuality.hd1080),
    400: type(videoQ: VideoQuality.hd1440),
    401: type(videoQ: VideoQuality.hd2160),
    402: type(videoQ: VideoQuality.hd2880p)
  };

  static bool isKnown(int itag) {
    return itagMap.containsKey(itag);
  }

  static valueOf(int itag) {
    if (itagMap.containsKey(itag)) {
      return itagMap[itag];
    } else {
      throw ArgumentError('$itag is not available');
    }
  }

  int _id;
  VideoQuality videoQuality;
  AudioQuality audioQuality;
  bool isVRor3D;

  // Itag() {
  // }

  // Itag(VideoQuality videoQuality) {
  //     this(videoQuality, AudioQuality.noAudio, false);
  // }

  // Itag(AudioQuality audioQuality) {
  //     this(VideoQuality.noVideo, audioQuality, false);
  // }

  // Itag(VideoQuality videoQuality, AudioQuality audioQuality) {
  //     this(videoQuality, audioQuality, false);
  // }

  // Itag(VideoQuality videoQuality, AudioQuality audioQuality, boolean isVRor3D) {
  //     setId(Integer.parseInt(name().substring(1)));
  //     this.videoQuality = videoQuality;
  //     this.audioQuality = audioQuality;
  //     this.isVRor3D = isVRor3D;
  // }
  set setid(int id) {
    this._id = id;
  }

  get id => _id;

    VideoQuality videoQualityf() {
       return videoQuality;
   }


//  VideoQuality getVideoQuality(int itag) {
//     var result = itagMap[itag].videoQuality;

//     if (result == null) {
//       throw new ArgumentError('Unexpected itag [$itag].');
//     }

//     return result;
//   }

  // public AudioQuality audioQuality() {
  //     return audioQuality;
  // }

  

  // @Override
  // public String toString() {
  //     return String.valueOf(id);
  // }
}
