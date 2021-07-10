import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';

// void main() => runApp(CountingScreen());

// class CountingScreen extends StatefulWidget {
//   const CountingScreen({Key? key}) : super(key: key);

//   @override
//   _CountingScreenState createState() => _CountingScreenState();
// }

// class _CountingScreenState extends State<CountingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: InstanceOfGame(
//       numberOfCards: 4,
//     ));
//   }
// }

// class InstanceOfGame extends StatelessWidget {
//   final List<Image> imgs = [
//     Image.asset('assets/images/bird.png'),
//     Image.asset('assets/images/monkey.png'),
//     Image.asset('assets/images/owls.png')
//   ];

//   final int numberOfCards;
//   InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       verticalDirection: VerticalDirection.down,
//       textDirection: TextDirection.ltr,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         for (var i = 0; i < numberOfCards; i++)
//           Flexible(
//             flex: 1,
//             child: Container(
//               padding: EdgeInsets.only(left: 100 * (i % 2).toDouble()),
//               child: Alpha(
//                 img: imgs[1],
//               ),
//             ),
//           ),
//         Options(numberOfCards)
//       ],
//     );
//   }
// }

// class Alpha extends StatelessWidget {
//   final Image img;
//   Alpha({Key? key, required this.img}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return img;
//   }
// }

// class Options extends StatelessWidget {
//   final int rightAnswer;
//   Options(this.rightAnswer);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         textDirection: TextDirection.ltr,
//         verticalDirection: VerticalDirection.down,
//         textBaseline: TextBaseline.alphabetic,
//         children: [
//           Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(0),
//                 side: BorderSide(
//                   color: Colors.black,
//                 )),
//             child: Center(
//               child: Container(
//                   height: 80,
//                   width: 80,
//                   color: Colors.blue,
//                   padding: EdgeInsets.all(2.0),
//                   child: Center(
//                     child: Text(
//                       (rightAnswer * 2).toString(),
//                       textDirection: TextDirection.ltr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 50),
//                     ),
//                   )),
//             ),
//           ),
//           Card(
//             child: Center(
//                 child: Container(
//                     height: 80,
//                     width: 80,
//                     color: Colors.blue,
//                     padding: EdgeInsets.all(2.0),
//                     child: Center(
//                       child: Text(
//                         (rightAnswer + 2).toString(),
//                         textDirection: TextDirection.ltr,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 50),
//                       ),
//                     ))),
//           ),
//           Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(0),
//                 side: BorderSide(
//                   color: Colors.black,
//                 )),
//             child: Center(
//               child: Container(
//                   height: 80,
//                   width: 80,
//                   color: Colors.blue,
//                   padding: EdgeInsets.all(2.0),
//                   child: Center(
//                     child: Text(
//                       (rightAnswer).toString(),
//                       textDirection: TextDirection.ltr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 50),
//                     ),
//                   )),
//             ),
//           ),
//           Card(
//             child: Center(
//               child: Container(
//                   height: 80,
//                   width: 80,
//                   color: Colors.blue,
//                   padding: EdgeInsets.all(2.0),
//                   child: Center(
//                     child: Text(
//                       (rightAnswer + 3).toString(),
//                       textDirection: TextDirection.ltr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 50),
//                     ),
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
