import 'package:YoutubeExtract/lib/model/AbsstractVideoDetails.dart';

class VideoDetails extends AbstractVideoDetails {
  List<String> _keywords;
  String _shortDescription;
  num _viewCount;
  num _averageRating;
  bool _isLiveContent;
  String _liveUrl;
  Duration duration;

  VideoDetails(var details, String liveHLSUrl) : super(details) {
    // Super(json);

    title = details['title'];
    author = details['author'];
    isLive = details["isLive"];

    _shortDescription = details['shortDescription'];
    
    duration = Duration(seconds: int.parse(details['lengthSeconds']));
    _keywords = details['keywords']?.cast<String>() ?? null;
    _viewCount = int.tryParse(details['viewCount']) ?? null;

    _averageRating = details["averageRating"];
    //viewCount = details["viewCount"];

    _isLiveContent = details["isLiveContent"];

    // keywords = json.containsKey("keywords") ? json.getJSONArray("keywords").toJavaList(String.class) : new ArrayList<String>();

    _liveUrl = liveHLSUrl;
  }

  @override
  void checkDownload() {
    // if (isLive || (_isLiveContent && lengthSeconds == 0));
  }

   List<String> get keywords => _keywords;

  String description() => _shortDescription;

   viewCount() => _viewCount;

    averageRating() => _averageRating;

  bool isLiveContent() => _isLiveContent;

  String liveUrl() => _liveUrl;
}
