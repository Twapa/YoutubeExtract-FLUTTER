import 'dart:convert';

import 'dart:io';

class VideoDetails {
  String videoid;
  String title;
  Duration duration;
  List<String> keywords;
  String description;
  //List<String> thumbnails;
  String author;
  num viewCount;
  num averageRating;
  bool isLiveContent;
  
  String liveHLSUrl;

  

  VideoDetails(var details, this.videoid) {
    
    title = details['title'];
    author = details['author'];
    description = details['shortDescription'];
    duration = Duration(seconds: int.parse(details['lengthSeconds']));
    keywords = details['keywords']?.cast<String>() ?? null;
    viewCount = int.tryParse(details['viewCount']) ?? null;

    averageRating = details["averageRating"];
    //viewCount = details["viewCount"];

    isLiveContent = details["isLiveContent"];
    //isLive = details["isLive"];
    

   
  }

  @override
  String toString() {
    
    return " + "  " $description";
  }
}
