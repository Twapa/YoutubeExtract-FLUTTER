import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:YoutubeExtract/getplayer.dart';
import 'package:YoutubeExtract/lib/YoutubrDownloader.dart';
import 'package:YoutubeExtract/lib/model/YouDetails.dart';
import 'package:YoutubeExtract/lib/model/YoutubeVideo.dart';
import 'package:YoutubeExtract/lib/model/formats/AudioVideoFormat.dart';
import 'package:YoutubeExtract/lib/model/formats/VideoFormat.dart';
import 'package:YoutubeExtract/lib/model/quality/enums.dart';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

main() async {
  //await playe.getVideoPlayerContextAsync('48kmkN-v6-4');

  String DESPACITO_ID = "kJQP7kiw5Fk"; // despacito
   String mtz = "weQB4BL9zBM"; // despacito


  YoutubeDownloader downloader = new YoutubeDownloader();

  YoutubeVideo v = await downloader.getVideo(mtz);
   //await downloader.getVideo(DESPACITO_ID);
   
   print(v.details().author);

  // video details
  //VideoDetails details = v.details();
  //print(details.averageRating());

  // List<AudioVideoFormat> videoWithAudioFormats =
  //     await v.videoWithAudioFormats();
  // videoWithAudioFormats.forEach((it) {
  //   print('${it.audioQuality()}   : ${it.url}');
  // });

  // List<VideoFormat> videoFormats = v.findVideoWithQuality(VideoQuality.hd720);
  // videoFormats.forEach((it) {
  //   print('${it.qualityLabel} ${it.bitrate}');
  // });

   int itag = 18;
   var format = v.findFormatByItag(itag);
    v.download(format);
 // print(format.url);
  // Uri u = Uri.parse(format.url);
  //print(u);
}
