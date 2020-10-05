import 'dart:convert';

import 'package:YoutubeExtract/lib/extractor/Extractor.dart';
import 'package:YoutubeExtract/lib/model/YouDetails.dart';
import 'package:YoutubeExtract/lib/model/YoutubeVideo.dart';
import 'package:YoutubeExtract/lib/model/formats/Format.dart';
import 'package:YoutubeExtract/lib/model/playlist/PlaylistDetails.dart';
import 'package:YoutubeExtract/lib/model/playlist/PlaylistVideoDetails.dart';
import 'package:YoutubeExtract/lib/model/playlist/YoutubePlaylist.dart';
import 'package:YoutubeExtract/lib/parser/DefaultParser.dart';
import 'package:YoutubeExtract/lib/parser/Parser.dart';

class YoutubeDownloader {
  Parser parser;

  YoutubeDownloader() {
    parser = DefaultParser();
  }

  //  YoutubeDownloader(Parser parser) {
  //       this.parser = parser;
  //   }

  //  void setParserRequestProperty(String key, String value) {
  //     parser.getExtractor().setRequestProperty(key, value);
  // }

  // void setParserRetryOnFailure(int retryOnFailure) {
  //     parser.getExtractor().setRetryOnFailure(retryOnFailure);
  // }

  //  void addCipherFunctionPattern(int priority, String regex) {
  //     parser.getCipherFactory().addInitialFunctionPattern(priority, regex);
  // }

  //  void addCipherFunctionEquivalent(String regex, CipherFunction function) {
  //     parser.getCipherFactory().addFunctionEquivalent(regex, function);
  // }

  Future<YoutubeVideo> getVideo(String videoId) async {
    String htmlUrl = "https://www.youtube.com/watch?v=" + videoId;

    var ytPlayerConfig = await parser.getPlayerConfig(htmlUrl);

    var ytPlayerConfigJson = json.decode(ytPlayerConfig);

    VideoDetails videoDetails = parser.getVideoDetails(ytPlayerConfigJson);

    List<Format> formats = await parser.parseFormats(ytPlayerConfigJson);

    //List<SubtitlesInfo> subtitlesInfo = parser.getSubtitlesInfoFromCaptions(ytPlayerConfig);
    return YoutubeVideo(videoDetails, formats);
  }

  //  YoutubePlaylist getPlaylist(String playlistId) throws YoutubeException {
  //     String htmlUrl = "https://www.youtube.com/playlist?list=" + playlistId;

  //     JSONObject ytInitialData = parser.getInitialData(htmlUrl);

  //     PlaylistDetails playlistDetails = parser.getPlaylistDetails(playlistId, ytInitialData);

  //     List<PlaylistVideoDetails> videos = parser.getPlaylistVideos(ytInitialData, playlistDetails.videoCount());

  //     return new YoutubePlaylist(playlistDetails, videos);
  // }

//  List<SubtitlesInfo> getVideoSubtitles(String videoId) throws YoutubeException {
//         return parser.getSubtitlesInfo(videoId);
//     }

  getPlaylist(String playlistId) async {
    String htmlUrl = "https://www.youtube.com/playlist?list=" + playlistId;

    var ytInitialData = await parser.getInitialData(htmlUrl);

    PlaylistDetails playlistDetails =
        parser.getPlaylistDetails(playlistId, ytInitialData);

    List<PlaylistVideoDetails> videos =
        parser.getPlaylistVideos(ytInitialData, playlistDetails.videoCountf());

    

     return YoutubePlaylist(playlistDetails, videos);
  }
}
