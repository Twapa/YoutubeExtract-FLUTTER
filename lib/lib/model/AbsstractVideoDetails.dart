 abstract class AbstractVideoDetails {

   String _videoId;
   var _lengthSeconds;
   List<String> _thumbnails;

    // Subclass specific extraction
   String title;
   String author;
   bool isLive;

  // void checkDownload() throws DownloadUnavailableException;

   

  AbstractVideoDetails(var details) {
        _videoId = details["videoId"];
        _lengthSeconds = details["lengthSeconds"];


        // var jsonThumbnails = json.getJSONObject("thumbnail").getJSONArray("thumbnails");
        // thumbnails = new ArrayList<>(jsonThumbnails.size());
        // for (int i = 0; i < jsonThumbnails.size(); i++) {
        //     JSONObject jsonObject = jsonThumbnails.getJSONObject(i);
        //     if (jsonObject.containsKey("url"))
        //         thumbnails.add(jsonObject.getString("url"));
       // }
    }


    void checkDownload();

  String videoId(){
    return _videoId;
  }

  String  titlef(){
    return title;
  }

   lengthSecondsf(){
    return _lengthSeconds;
  }
    

  List<String> get thumbnails=>  _thumbnails;
     

  String  authorf(){
    return author;
  }
    

  bool  isLivef() {
    return isLive;
  }
    
}