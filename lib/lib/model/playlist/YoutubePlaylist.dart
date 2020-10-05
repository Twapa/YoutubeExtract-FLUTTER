


import '../Filter.dart';
import 'PlaylistDetails.dart';
import 'PlaylistVideoDetails.dart';

 class YoutubePlaylist {

     PlaylistDetails details;
     List<PlaylistVideoDetails> videos;

     YoutubePlaylist(PlaylistDetails details, List<PlaylistVideoDetails> videos) {
        this.details = details;
        this.videos = videos;
    }

   PlaylistDetails detailsf() {
        return details;
    }

   List<PlaylistVideoDetails> videosf() {
        return videos;
    }

   PlaylistVideoDetails findVideoById(String videoId) {
        for (PlaylistVideoDetails video in videos) {
            if (video.videoId()==videoId)
                return video;
        }
        return null;
    }

    List<PlaylistVideoDetails> findVideos(Filter<PlaylistVideoDetails> filter) {
        return filter.select(videos);
        
    }
}