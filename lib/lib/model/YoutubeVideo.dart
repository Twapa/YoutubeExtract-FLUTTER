import 'dart:io';

import 'package:YoutubeExtract/lib/model/Extensions.dart';
import 'package:YoutubeExtract/lib/model/YouDetails.dart';
import 'package:YoutubeExtract/lib/model/formats/AudioFormat.dart';
import 'package:YoutubeExtract/lib/model/formats/AudioVideoFormat.dart';
import 'package:YoutubeExtract/lib/model/formats/Format.dart';
import 'package:YoutubeExtract/lib/model/formats/VideoFormat.dart';
import 'package:YoutubeExtract/lib/model/quality/enums.dart';
import 'package:http/http.dart' as http;

class YoutubeVideo {
  VideoDetails videoDetails;
  List<Format> formats;
  //List<SubtitlesInfo> subtitlesInfo;

  YoutubeVideo(VideoDetails videoDetails, List<Format> formats) {
    this.videoDetails = videoDetails;
    this.formats = formats;
    //this.subtitlesInfo = subtitlesInfo;
  }

  VideoDetails details() {
    return videoDetails;
  }

  List<Format> formatsf() {
    return formats;
  }

  //  List<Format> findFormats(Predicate<Format> filter) {
  //       return formats.stream().filter(filter).collect(Collectors.toList());
  //   }

  Format findFormatByItag(int itag) {
    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format.tag == itag) return format;
    }
    return null;
  }

  Future<List<AudioVideoFormat>> videoWithAudioFormats() async {
    List<AudioVideoFormat> find = [];

    for (int i = 0; i < formats.length; i++) {
      // formats = formats
      Format format = formats.elementAt(i);
      if (format is AudioVideoFormat) find.add(format);
    }
    return find;
  }

  List<VideoFormat> videoFormats() {
    List<VideoFormat> find = List();

    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format is VideoFormat) find.add(format);
    }
    return find;
  }

  List<VideoFormat> findVideoWithQuality(VideoQuality videoQuality) {
    List<VideoFormat> find = List();

    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format is VideoFormat && (format.videoQualityf() == videoQuality))
        find.add(format);
    }
    return find;
  }

  List<VideoFormat> findVideoWithExtension(Extensions extensions) {
    List<VideoFormat> find = List();

    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format is VideoFormat && format.extensionsf() == extensions)
        find.add(format);
    }
    return find;
  }

  List<AudioFormat> audioFormats() {
    List<AudioFormat> find = new List();

    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format is AudioFormat) find.add(format);
    }
    return find;
  }

  List<AudioFormat> findAudioWithQuality(AudioQuality audioQuality) {
    List<AudioFormat> find = List();

    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format is AudioFormat && (format.audioQualityf() == audioQuality))
        find.add(format);
    }
    return find;
  }

  List<AudioFormat> findAudioWithExtension(Extensions extensions) {
    List<AudioFormat> find = List();

    for (int i = 0; i < formats.length; i++) {
      Format format = formats.elementAt(i);
      if (format is AudioFormat && format.extensionsf() == extensions)
        find.add(format);
    }
    return find;
  }

  download(Format format) async {
    var url = format.url;
    

    // String title = details().title;
    // var fileName = '${title}.${format.extensions.value()}'
    //     .replaceAll(r'\', '')
    //     .replaceAll('/', '')
    //     .replaceAll('*', '')
    //     .replaceAll('?', '')
    //     .replaceAll('"', '')
    //     .replaceAll('<', '')
    //     .replaceAll('>', '')
    //     .replaceAll('|', '');
    // ;

    // File file =
    //     File('G:\\flutter projects\\YoutubeExtract\\downloaded\\$fileName');
    // Uri uri = Uri.parse(url);
    // // Create the StreamedRequest to track the download status.
    // var req = http.Request('get', uri);
    // var resp = await req.send() ?? null;

    // // Open the file in appendMode.
    // var output = file.openWrite(mode: FileMode.writeOnlyAppend);

    // var len = resp.contentLength;
    // var count = 0;
    // var oldProgress = -1;

    // resp.stream.listen((data) {
    //   count += data.length;
    //   var progress = ((count / len) * 100).round();
    //   if (progress != oldProgress) {
    //     print('$progress%');

    //     oldProgress = progress;
    //   }

    //   output.add(data);
    // }, onDone: () async {
    //   await output.close();
    // }).asFuture();
  }
  //     videoDetails.checkDownload();

  //     createOutDir(outDir);

  //     File outputFile = getOutputFile(removeIllegalChars(fileName), format, outDir, overwrite);

  //     URL url = new URL(format.url());
  //     BufferedInputStream bis = null;
  //     FileOutputStream fos = null;
  //     try {
  //         bis = new BufferedInputStream(url.openStream());
  //         fos = new FileOutputStream(outputFile);
  //         byte[] buffer = new byte[4096];
  //         int count = 0;
  //         while ((count = bis.read(buffer, 0, 4096)) != -1) {
  //             fos.write(buffer, 0, count);
  //         }
  //     } finally {
  //         if (bis != null) {
  //             try {
  //                 bis.close();
  //             } catch (IOException ignored) {
  //             }
  //         }
  //         if (fos != null) {
  //             try {
  //                 fos.close();
  //             } catch (IOException ignored) {
  //             }
  //         }
  //     }
  //     return outputFile;
  // }

}
