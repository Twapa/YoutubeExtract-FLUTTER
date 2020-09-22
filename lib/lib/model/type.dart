import 'package:YoutubeExtract/lib/model/quality/enums.dart';

class type {
  VideoQuality videoQ;
  AudioQuality audioQ;
  bool b;

  type({this.videoQ, this.audioQ, this.b});
  // type({VideoQuality videoQ, AudioQuality audioQ, bool b}) {
  //   this.videoQ = videoQ ;
  //   this.audioQ = audioQ;
  //   this.b = b ;
  // }

  VideoQuality get videoQuality => this.videoQ;

  AudioQuality get audioQuality => this.audioQ;

 bool isVideo() {
        return this.videoQ != null;
    }
 bool isAudio() {
        return this.audioQ != null;
    }


  @override
  String toString() {
    // TODO: implement toString
    return '${this.videoQ}  ${this.audioQ}  ${this.b}';
  }
}
