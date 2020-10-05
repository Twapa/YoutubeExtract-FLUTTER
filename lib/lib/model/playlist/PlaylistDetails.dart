

 import 'dart:io';

class PlaylistDetails {

    String playlistId;
    String title;
    String author;
    var videoCount;
    //int viewCount;

  PlaylistDetails(String playlistId, String title, String author, var videoCount) {
     //   super();
        this.playlistId = playlistId;
        this.title = title;
        this.author = author;
        this.videoCount = videoCount;
       // this.viewCount = viewCount;
    }

  String playlistIdf() {
        return playlistId;
    }

  String titlef() {
        return title;
    }

 String authorf() {
        return author;
    }

  videoCountf() {

    
        return videoCount;
    }


    @override
  String toString() {
    // TODO: implement toString
    return '$title';
  }

//  int viewCountf() {
//         return viewCount;
//     }
}
