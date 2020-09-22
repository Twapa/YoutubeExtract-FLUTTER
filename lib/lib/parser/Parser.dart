import 'package:YoutubeExtract/lib/model/YouDetails.dart';
import 'package:YoutubeExtract/lib/model/formats/Format.dart';

abstract class Parser {

    // Extractor getExtractor();

    // CipherFactory getCipherFactory();

    // /* Video */

     Future<dynamic> getPlayerConfig(String htmlUrl);

     VideoDetails getVideoDetails(var config);

     String getJsUrl(var config);

    // List<SubtitlesInfo> getSubtitlesInfoFromCaptions(JSONObject config);

    // List<SubtitlesInfo> getSubtitlesInfo(String videoId) throws YoutubeException;

       parseFormats(var json);

    /* Playlist */

    // JSONObject getInitialData(String htmlUrl) throws YoutubeException;

    // PlaylistDetails getPlaylistDetails(String playlistId, JSONObject initialData);

    // List<PlaylistVideoDetails> getPlaylistVideos(JSONObject initialData, int videoCount)  throws YoutubeException;
}