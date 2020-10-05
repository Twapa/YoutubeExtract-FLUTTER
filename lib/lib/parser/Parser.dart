import 'package:YoutubeExtract/lib/model/YouDetails.dart';
import 'package:YoutubeExtract/lib/model/formats/Format.dart';

abstract class Parser {

     getExtractor();

    // getCipherFactory();

    // /* Video */

     Future<dynamic> getPlayerConfig(String htmlUrl);

     VideoDetails getVideoDetails(var config);

     String getJsUrl(var config);

    // List<SubtitlesInfo> getSubtitlesInfoFromCaptions(JSONObject config);

    // List<SubtitlesInfo> getSubtitlesInfo(String videoId) throws YoutubeException;

       parseFormats(var json);

    /* Playlist */

     getInitialData(String htmlUrl);

     getPlaylistDetails(String playlistId, var initialData);

     getPlaylistVideos(var initialData, var videoCount);
}