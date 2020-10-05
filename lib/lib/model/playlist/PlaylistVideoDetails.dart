import '../AbsstractVideoDetails.dart';

class PlaylistVideoDetails extends AbstractVideoDetails {
  var index;
  bool isPlayable;

  //  PlaylistVideoDetails() {}

  PlaylistVideoDetails(var json) : super(json) {
    if (json.containsKey("shortBylineText")) {
      author = json["shortBylineText"]["runs"][0]["text"];
    }
    var jsonTitle = json["title"];
    if (jsonTitle.containsKey("simpleText")) {
      title = jsonTitle["simpleText"];
    } else {
      title = jsonTitle["runs"][0]["text"];
    }
    // if (!thumbnails().isEmpty()) {
    //     // Otherwise, contains "/hqdefault.jpg?"
    //     isLive = thumbnails().get(0).contains("/hqdefault_live.jpg?");
    // }

    if (json.containsKey("index")) {
      index = json["index"]["simpleText"];
    }
    isPlayable = json["isPlayable"];
  }

  @override
  void checkDownload() {
    if (!isPlayable) {
      print('failed');
    } else if (isLivef() || lengthSecondsf() == 0) {
      throw ("Can not download live stream");
    }
  }

  int indexf() {
    return index;
  }

  bool isPlayablef() {
    return isPlayable;
  }
}
