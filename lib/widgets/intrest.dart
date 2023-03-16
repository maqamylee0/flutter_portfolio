import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pod_player/pod_player.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Intrest extends StatefulWidget {
  final String url;
  const Intrest(
      { Key? key,required this.url})
      : super(key: key);

  @override
  State<Intrest> createState() => _IntrestState();
}

class _IntrestState extends State<Intrest> {
  late final YoutubePlayerController _controller;
  String? videoId;

  @override
  void initState() {
    super.initState();
  }
   _initialize() async {
     videoId = YoutubePlayer.convertUrlToId(widget.url)!;
     _controller = YoutubePlayerController(
       initialVideoId: videoId!,
       flags: YoutubePlayerFlags(
         autoPlay: true,
         mute: true,
       ),
     );
   }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,

      child: Stack(
        children: [
          Positioned(
            right: 10,
              bottom: 10,
              child: FloatingActionButton(
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              // setState(() {
              //   // If the video is playing, pause it.
              //   if (_controller.value.isPlaying) {
              //     _controller.pause();
              //   } else {
              //     // If the video is paused, play it.
              //     _controller.play();
               // }
            //  });
            },
            // Display the correct icon depending on the state of the player.
            child: Icon(
              Icons.play_arrow
              // controller.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          )),
          FutureBuilder(
          future: _initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: 4,
                // Use the VideoPlayer widget to display the video.
                child:YoutubePlayer(
                  controller: _controller,
                  liveUIColor: Colors.amber,
                )                ,
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
          ,]
      ),
    );
  }
}
