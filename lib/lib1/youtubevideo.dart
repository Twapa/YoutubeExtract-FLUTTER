import 'package:youtubeDownloader/lib1/models/VideoDetails.dart';


class YoutubeVideo {
  VideoDetails _videoDetails;

  YoutubeVideo(VideoDetails videoDetails) {
    this._videoDetails = videoDetails;
  }

    videoDetails() {

    return _videoDetails;
  }
  
}
