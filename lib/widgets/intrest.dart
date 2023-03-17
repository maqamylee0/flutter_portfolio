import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pod_player/pod_player.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class Intrest extends StatefulWidget {
  final String url;
  const Intrest(
      { Key? key,required this.url})
      : super(key: key);

  @override
  State<Intrest> createState() => _IntrestState();
}

class _IntrestState extends State<Intrest> {
  late VideoPlayerController _controller;
  late Duration videoLength;
  late Duration videoPosition;
  double volume = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
      ..addListener(() => setState(() {
        videoPosition = _controller.value.position;
      }))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          videoLength = _controller.value.duration;
        });
      });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,

      child: Column(
        children: [
          Text('Hi this is an app i made about Tenants'),
          if (_controller.value.isInitialized) ...[
            GestureDetector(
              onTap: (){
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              child: AspectRatio(
                aspectRatio: 0.7,
                child: SizedBox(

                    child: VideoPlayer(_controller)),
              ),
            ),
            SizedBox(
              width: 200,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: EdgeInsets.all(10),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: () => setState(
                        () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    },
                  ),
                ),
                Text(
                    '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}'),
                // SizedBox(width: 10),
                Icon(animatedVolumeIcon(volume)),
                // Slider(
                //     value: volume,
                //     min: 0,
                //     max: 1,
                //     onChanged: (changedVolume) {
                //       setState(() {
                //         volume = changedVolume;
                //         _controller.setVolume(changedVolume);
                //       });
                //     }),
                // Spacer(),
                IconButton(
                    icon: Icon(Icons.loop,
                        color: _controller.value.isLooping
                            ? Colors.green
                            : Colors.black),
                    onPressed: () {
                      _controller.setLooping(!_controller.value.isLooping);
                    })
              ],
            )
          ]
        ],
      ),
    );
  }


String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes % 60;

  final minutes =
  parsedMinutes < 10 ? '0$parsedMinutes' : parsedMinutes.toString();

  final parsedSeconds = duration.inSeconds % 60;

  final seconds =
  parsedSeconds < 10 ? '0$parsedSeconds' : parsedSeconds.toString();

  return '$minutes:$seconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}
}
