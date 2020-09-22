import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

class player {


 RegExp _statIndexExp = RegExp(r'\(\w+,(\d+)\)');

   RegExp _funcBodyExp = RegExp(
      r'(\w+)=function\(\w+\){(\w+)=\2\.split\(\x22{2}\);.*?return\s+\2\.join\(\x22{2}\)}');

   RegExp _objNameExp = RegExp(r'([\$_\w]+).\w+\(\w+,\d+\);');

   RegExp _calledFuncNameExp = RegExp(r'\w+(?:.|\[)(\"?\w+(?:\")?)\]?\(');

   String _root;


  http.Client httped;

  player() {
    httped = http.Client();
  }

  Future<PlayerContext> getVideoPlayerContextAsync(String videoId) async {
    // Build the required url and get the response
    var url =
        'https://www.youtube.com/embed/$videoId?disable_polymer=true&hl=en';
    var body = (await httped.get(url)).body;

    print(body);
    var htm = html.parse(body);

    
    // Extract the config part
    var config = RegExp(r";ytplayer\\.config = (\\{.*?\\});", multiLine: true)
        .firstMatch(htm.toString())
        .group(0);

    // Trip off the start and end to get a valid JSON string
    config = config.substring(30, config.length - 3);

    // Decode the json
    var root = json.decode(config);

    // Get the player source url
    var playerSourceUrl = root["assets"]["js"].toString();
    if (playerSourceUrl != null && playerSourceUrl.isNotEmpty) {
      playerSourceUrl = "https://www.youtube.com" + playerSourceUrl;
    }

    // Get the sts
    var sts = root["sts"].toString();

    // Check if successful
    if (playerSourceUrl == null ||
        playerSourceUrl.isEmpty ||
        sts == null ||
        sts.isEmpty) ;

    return PlayerContext(playerSourceUrl, sts);
  }
}

class PlayerContext {
  PlayerContext(this.sourceUrl, this.sts);

  String sourceUrl;
  String sts;

  @override
  String toString() {
    // TODO: implement toString
    return '$sourceUrl + $sts';
  }
}
