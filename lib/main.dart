import 'dart:convert';
import 'dart:isolate';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:youtubeDownloader/lib1/models/videodetails.dart';
import 'package:youtubeDownloader/lib1/youtubevideo.dart';

main(List<String> args) async {
  //https://m.youtube.com/watch?v=bESGLojNYSo
  String videoid = 'bESGLojNYSo';
  var ht = await getVideo(videoid);
  var playerResponseJson = json.decode(ht['player_response']);
  var playAbility = playerResponseJson['playabilityStatus'];

  var details = playerResponseJson['videoDetails'];
  var streamingData = playerResponseJson['streamingData'];

  

  

  VideoDetails vi = VideoDetails( details, videoid);

  print(vi);

  // var varr = videoDetails.keywords;

  //YoutubeVideo youtubeVideo = YoutubeVideo(vi);
}

Future<Map<String, String>> getVideo(String videoId) async {
  var httped = http.Client();
  var eurl = Uri.encodeFull('https://youtube.googleapis.com/v/$videoId');

  var url = 'https://youtube.com/get_video_info?video_id=$videoId'
      '&el=embedded&eurl=$eurl&hl=en';
  var raw = (await httped.get(url)).body;
  return Uri.splitQueryString(raw);
}

