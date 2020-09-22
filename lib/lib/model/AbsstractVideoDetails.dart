 abstract class AbstractVideoDetails {

   String _videoId;
//int _lengthSeconds;
   List<String> _thumbnails;

    // Subclass specific extraction
   String title;
   String author;
   bool isLive;

  // void checkDownload() throws DownloadUnavailableException;

   

  AbstractVideoDetails(var details) {
        _videoId = details["videoId"];
       // _lengthSeconds = details["lengthSeconds"];


        // var jsonThumbnails = json.getJSONObject("thumbnail").getJSONArray("thumbnails");
        // thumbnails = new ArrayList<>(jsonThumbnails.size());
        // for (int i = 0; i < jsonThumbnails.size(); i++) {
        //     JSONObject jsonObject = jsonThumbnails.getJSONObject(i);
        //     if (jsonObject.containsKey("url"))
        //         thumbnails.add(jsonObject.getString("url"));
       // }
    }


    void checkDownload();

  String get videoId=>  _videoId;

  String  titlef(){
    return title;
  }

  //int get lengthSeconds=> _lengthSeconds;
    

  List<String> get thumbnails=>  _thumbnails;
     

  String get authorf{
    return author;
  }
    

  bool get isLivef {
    return isLive;
  }
    
}