import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:YoutubeExtract/lib/YoutubrDownloader.dart';
import 'package:YoutubeExtract/lib/model/YouDetails.dart';
import 'package:YoutubeExtract/lib/model/YoutubeVideo.dart';
import 'package:YoutubeExtract/lib/model/formats/AudioVideoFormat.dart';
import 'package:YoutubeExtract/lib/model/formats/VideoFormat.dart';
import 'package:YoutubeExtract/lib/model/playlist/PlaylistDetails.dart';
import 'package:YoutubeExtract/lib/model/playlist/YoutubePlaylist.dart';
import 'package:YoutubeExtract/lib/model/quality/enums.dart';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

main() async {
  //await playe.getVideoPlayerContextAsync('48kmkN-v6-4');

  String DESPACITO_ID = "VJfFS_6Y_i4"; // despacito
  String mtz = "X3VB-MEdNhw"; // despacito
  // https://www.youtube.com/watch?v=it32Q16TVeE
  //https://www.youtube.com/watch?v=VJfFS_6Y_i4
  //https://www.youtube.com/watch?v=hYq8sGZJyOA
  //https://www.youtube.com/watch?v=R5WlB2i60y8
  // https://www.youtube.com/watch?v=EEw6tQV98XE

  YoutubeDownloader downloader = new YoutubeDownloader();

  // YoutubeVideo v = await downloader.getVideo(mtz);
  //await downloader.getVideo(DESPACITO_ID);

  // print(v.details().author);

  // video details
  //VideoDetails details = v.details();
  //print(details.averageRating());

  YoutubePlaylist playlist =
      await downloader.getPlaylist('PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua');

  // print(playlist.videos.map((e) => e.title));

  var firstv = playlist.videos.first;
  print(firstv.indexf());

  int itag = 18;
  // var format = v.findFormatByItag(itag);
  // v.download(format);
  //print(format.typeoff());
  // Uri u = Uri.parse(format.url);
  //print(u);
}
