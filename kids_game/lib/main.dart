// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(VideoApp());

// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

/// An example of using the plugin, controlling lifecycle and playback of the
/// video.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    MaterialApp(
      home: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: const ValueKey<String>('home_page'),
        appBar: AppBar(
          title: const Text('Video player example'),
          actions: <Widget>[
            IconButton(
              key: const ValueKey<String>('push_tab'),
              icon: const Icon(Icons.navigation),
              onPressed: () {
                Navigator.push<_PlayerVideoAndPopPage>(
                  context,
                  MaterialPageRoute<_PlayerVideoAndPopPage>(
                    builder: (BuildContext context) => _PlayerVideoAndPopPage(),
                  ),
                );
              },
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              // Tab(
              //   icon: Icon(Icons.cloud),
              //   text: "Remote",
              // ),
              Tab(icon: Icon(Icons.insert_drive_file), text: "Asset"),
              Tab(icon: Icon(Icons.list), text: "List example"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // _BumbleBeeRemoteVideo(),
            _ButterFlyAssetVideo(),
            _ButterFlyAssetVideoInList(),
          ],
        ),
      ),
    );
  }
}

class _ButterFlyAssetVideoInList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _ExampleCard(title: "Item a"),
        _ExampleCard(title: "Item b"),
        _ExampleCard(title: "Item c"),
        _ExampleCard(title: "Item d"),
        _ExampleCard(title: "Item e"),
        _ExampleCard(title: "Item f"),
        _ExampleCard(title: "Item g"),
        Card(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.cake),
                title: Text("Video video"),
              ),
              Stack(
                  alignment: FractionalOffset.bottomRight +
                      const FractionalOffset(-0.1, -0.1),
                  children: <Widget>[
                    _ButterFlyAssetVideo(),
                    Image.asset('assets/flutter-mark-square-64.png'),
                  ]),
            ],
          ),
        ])),
        _ExampleCard(title: "Item h"),
        _ExampleCard(title: "Item i"),
        _ExampleCard(title: "Item j"),
        _ExampleCard(title: "Item k"),
        _ExampleCard(title: "Item l"),
      ],
    );
  }
}

/// A filler card to show the video in a list of scrolling contents.
class _ExampleCard extends StatelessWidget {
  const _ExampleCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.airline_seat_flat_angled),
            title: Text(title),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
              TextButton(
                child: const Text('SELL TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButterFlyAssetVideo extends StatefulWidget {
  @override
  _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
}

class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/carrace.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _BumbleBeeRemoteVideo extends StatefulWidget {
//   @override
//   _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
// }

// class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
//   late VideoPlayerController _controller;

//   Future<ClosedCaptionFile> _loadCaptions() async {
//     final String fileContents = await DefaultAssetBundle.of(context)
//         .loadString('assets/bumble_bee_captions.srt');
//     return SubRipCaptionFile(fileContents);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//       closedCaptionFile: _loadCaptions(),
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     );

//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(padding: const EdgeInsets.only(top: 20.0)),
//           const Text('With remote mp4'),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller),
//                   ClosedCaption(text: _controller.value.caption.text),
//                   _ControlsOverlay(controller: _controller),
//                   VideoProgressIndicator(_controller, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

class _PlayerVideoAndPopPage extends StatefulWidget {
  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}



// // import 'dart:async';
// // import 'dart:io';
// // import 'package:audioplayers/audio_cache.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:path_provider/path_provider.dart';
// // import 'package:provider/provider.dart';

// // import 'player_widget.dart';

// // typedef OnError = void Function(Exception exception);

// // const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
// // const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
// // const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';

// // void main() {
// //   runApp(MaterialApp(home: ExampleApp()));
// // }

// // class ExampleApp extends StatefulWidget {
// //   @override
// //   _ExampleAppState createState() => _ExampleAppState();
// // }

// // class _ExampleAppState extends State<ExampleApp> {
// //   AudioCache audioCache = AudioCache();
// //   AudioPlayer advancedPlayer = AudioPlayer();
// //   String? localFilePath;
// //   String? localAudioCacheURI;

// //   @override
// //   void initState() {
// //     super.initState();

// //     if (kIsWeb) {
// //       // Calls to Platform.isIOS fails on web
// //       return;
// //     }
// //     if (Platform.isIOS) {
// //       audioCache.fixedPlayer?.notificationService.startHeadlessService();
// //       advancedPlayer.notificationService.startHeadlessService();
// //     }
// //   }

// //   Future _loadFile() async {
// //     final bytes = await readBytes(Uri.parse(kUrl1));
// //     final dir = await getApplicationDocumentsDirectory();
// //     final file = File('${dir.path}/audio.mp3');

// //     await file.writeAsBytes(bytes);
// //     if (file.existsSync()) {
// //       setState(() => localFilePath = file.path);
// //     }
// //   }

// //   Widget remoteUrl() {
// //     return const SingleChildScrollView(
// //       child: _Tab(
// //         children: [
// //           Text(
// //             'Sample 1 ($kUrl1)',
// //             key: Key('url1'),
// //             style: TextStyle(fontWeight: FontWeight.bold),
// //           ),
// //           PlayerWidget(url: kUrl1),
// //           Text(
// //             'Sample 2 ($kUrl2)',
// //             style: TextStyle(fontWeight: FontWeight.bold),
// //           ),
// //           PlayerWidget(url: kUrl2),
// //           Text(
// //             'Sample 3 ($kUrl3)',
// //             style: TextStyle(fontWeight: FontWeight.bold),
// //           ),
// //           PlayerWidget(url: kUrl3),
// //           Text(
// //             'Sample 4 (Low Latency mode) ($kUrl1)',
// //             style: TextStyle(fontWeight: FontWeight.bold),
// //           ),
// //           PlayerWidget(url: kUrl1, mode: PlayerMode.LOW_LATENCY),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget localFile() {
// //     return _Tab(children: [
// //       const Text(' -- manually load bytes (no web!) --'),
// //       const Text('File: $kUrl1'),
// //       _Btn(txt: 'Download File to your Device', onPressed: _loadFile),
// //       Text('Current local file path: $localFilePath'),
// //       if (localFilePath != null) PlayerWidget(url: localFilePath!),
// //       Container(
// //         constraints: const BoxConstraints.expand(width: 1.0, height: 20.0),
// //       ),
// //       const Text(' -- via AudioCache --'),
// //       const Text('File: $kUrl2'),
// //       _Btn(txt: 'Download File to your Device', onPressed: _loadFileAC),
// //       Text('Current AC loaded: $localAudioCacheURI'),
// //       if (localAudioCacheURI != null) PlayerWidget(url: localAudioCacheURI!),
// //     ]);
// //   }

// //   void _loadFileAC() async {
// //     final uri = await audioCache.load(kUrl2);
// //     setState(() => localAudioCacheURI = uri.toString());
// //   }

// //   Widget localAsset() {
// //     return SingleChildScrollView(
// //       child: _Tab(
// //         children: [
// //           const Text("Play Local Asset 'audio.mp3':"),
// //           _Btn(txt: 'Play', onPressed: () => audioCache.play('audio.mp3')),
// //           const Text("Play Local Asset (via byte source) 'audio.mp3':"),
// //           _Btn(
// //             txt: 'Play',
// //             onPressed: () async {
// //               final bytes = await (await audioCache.loadAsFile('audio.mp3'))
// //                   .readAsBytes();
// //               audioCache.playBytes(bytes);
// //             },
// //           ),
// //           const Text("Loop Local Asset 'audio.mp3':"),
// //           _Btn(txt: 'Loop', onPressed: () => audioCache.loop('audio.mp3')),
// //           const Text("Loop Local Asset (via byte source) 'audio.mp3':"),
// //           _Btn(
// //             txt: 'Loop',
// //             onPressed: () async {
// //               final bytes = await (await audioCache.loadAsFile('audio.mp3'))
// //                   .readAsBytes();
// //               audioCache.playBytes(bytes, loop: true);
// //             },
// //           ),
// //           const Text("Play Local Asset 'audio2.mp3':"),
// //           _Btn(txt: 'Play', onPressed: () => audioCache.play('audio2.mp3')),
// //           const Text("Play Local Asset In Low Latency 'audio.mp3':"),
// //           _Btn(
// //             txt: 'Play',
// //             onPressed: () {
// //               audioCache.play('audio.mp3', mode: PlayerMode.LOW_LATENCY);
// //             },
// //           ),
// //           const Text(
// //             "Play Local Asset Concurrently In Low Latency 'audio.mp3':",
// //           ),
// //           _Btn(
// //             txt: 'Play',
// //             onPressed: () async {
// //               await audioCache.play(
// //                 'audio.mp3',
// //                 mode: PlayerMode.LOW_LATENCY,
// //               );
// //               await audioCache.play(
// //                 'audio2.mp3',
// //                 mode: PlayerMode.LOW_LATENCY,
// //               );
// //             },
// //           ),
// //           const Text("Play Local Asset In Low Latency 'audio2.mp3':"),
// //           _Btn(
// //             txt: 'Play',
// //             onPressed: () {
// //               audioCache.play('audio2.mp3', mode: PlayerMode.LOW_LATENCY);
// //             },
// //           ),
// //           getLocalFileDuration(),
// //         ],
// //       ),
// //     );
// //   }

// //   Future<int> _getDuration() async {
// //     final uri = await audioCache.load('audio2.mp3');
// //     await advancedPlayer.setUrl(uri.toString());
// //     return Future.delayed(
// //       const Duration(seconds: 2),
// //       () => advancedPlayer.getDuration(),
// //     );
// //   }

// //   FutureBuilder<int> getLocalFileDuration() {
// //     return FutureBuilder<int>(
// //       future: _getDuration(),
// //       builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
// //         switch (snapshot.connectionState) {
// //           case ConnectionState.none:
// //             return const Text('No Connection...');
// //           case ConnectionState.active:
// //           case ConnectionState.waiting:
// //             return const Text('Awaiting result...');
// //           case ConnectionState.done:
// //             if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             }
// //             return Text(
// //               'audio2.mp3 duration is: ${Duration(milliseconds: snapshot.data!)}',
// //             );
// //           default:
// //             return Container();
// //         }
// //       },
// //     );
// //   }

// //   Widget notification() {
// //     return _Tab(
// //       children: [
// //         const Text("Play notification sound: 'messenger.mp3':"),
// //         _Btn(
// //           txt: 'Play',
// //           onPressed: () =>
// //               audioCache.play('messenger.mp3', isNotification: true),
// //         ),
// //       ],
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: [
// //         StreamProvider<Duration>.value(
// //           initialData: const Duration(),
// //           value: advancedPlayer.onAudioPositionChanged,
// //         ),
// //       ],
// //       child: DefaultTabController(
// //         length: 5,
// //         child: Scaffold(
// //           appBar: AppBar(
// //             bottom: const TabBar(
// //               tabs: [
// //                 Tab(text: 'Remote Url'),
// //                 Tab(text: 'Local File'),
// //                 Tab(text: 'Local Asset'),
// //                 Tab(text: 'Notification'),
// //                 Tab(text: 'Advanced'),
// //               ],
// //             ),
// //             title: const Text('audioplayers Example'),
// //           ),
// //           body: TabBarView(
// //             children: [
// //               remoteUrl(),
// //               localFile(),
// //               localAsset(),
// //               notification(),
// //               Advanced(advancedPlayer: advancedPlayer),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Advanced extends StatefulWidget {
// //   final AudioPlayer advancedPlayer;

// //   const Advanced({Key? key, required this.advancedPlayer}) : super(key: key);

// //   @override
// //   _AdvancedState createState() => _AdvancedState();
// // }

// // class _AdvancedState extends State<Advanced> {
// //   bool? seekDone;

// //   @override
// //   void initState() {
// //     widget.advancedPlayer.onSeekComplete
// //         .listen((event) => setState(() => seekDone = true));
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final audioPosition = Provider.of<Duration>(context);
// //     return SingleChildScrollView(
// //       child: _Tab(
// //         children: [
// //           Column(
// //             children: [
// //               const Text('Source Url'),
// //               Row(
// //                 children: [
// //                   _Btn(
// //                     txt: 'Audio 1',
// //                     onPressed: () => widget.advancedPlayer.setUrl(kUrl1),
// //                   ),
// //                   _Btn(
// //                     txt: 'Audio 2',
// //                     onPressed: () => widget.advancedPlayer.setUrl(kUrl2),
// //                   ),
// //                   _Btn(
// //                     txt: 'Stream',
// //                     onPressed: () => widget.advancedPlayer.setUrl(kUrl3),
// //                   ),
// //                 ],
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               ),
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               const Text('Release Mode'),
// //               Row(
// //                 children: [
// //                   _Btn(
// //                     txt: 'STOP',
// //                     onPressed: () =>
// //                         widget.advancedPlayer.setReleaseMode(ReleaseMode.STOP),
// //                   ),
// //                   _Btn(
// //                     txt: 'LOOP',
// //                     onPressed: () =>
// //                         widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP),
// //                   ),
// //                   _Btn(
// //                     txt: 'RELEASE',
// //                     onPressed: () => widget.advancedPlayer
// //                         .setReleaseMode(ReleaseMode.RELEASE),
// //                   ),
// //                 ],
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               ),
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               const Text('Volume'),
// //               Row(
// //                 children: [0.0, 0.3, 0.5, 1.0, 1.1, 2.0].map((e) {
// //                   return _Btn(
// //                     txt: e.toString(),
// //                     onPressed: () => widget.advancedPlayer.setVolume(e),
// //                   );
// //                 }).toList(),
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               ),
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               const Text('Control'),
// //               Row(
// //                 children: [
// //                   _Btn(
// //                     txt: 'resume',
// //                     onPressed: () => widget.advancedPlayer.resume(),
// //                   ),
// //                   _Btn(
// //                     txt: 'pause',
// //                     onPressed: () => widget.advancedPlayer.pause(),
// //                   ),
// //                   _Btn(
// //                     txt: 'stop',
// //                     onPressed: () => widget.advancedPlayer.stop(),
// //                   ),
// //                   _Btn(
// //                     txt: 'release',
// //                     onPressed: () => widget.advancedPlayer.release(),
// //                   ),
// //                 ],
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               ),
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               const Text('Seek in milliseconds'),
// //               Row(
// //                 children: [
// //                   _Btn(
// //                     txt: '100ms',
// //                     onPressed: () {
// //                       widget.advancedPlayer.seek(
// //                         Duration(
// //                           milliseconds: audioPosition.inMilliseconds + 100,
// //                         ),
// //                       );
// //                       setState(() => seekDone = false);
// //                     },
// //                   ),
// //                   _Btn(
// //                     txt: '500ms',
// //                     onPressed: () {
// //                       widget.advancedPlayer.seek(
// //                         Duration(
// //                           milliseconds: audioPosition.inMilliseconds + 500,
// //                         ),
// //                       );
// //                       setState(() => seekDone = false);
// //                     },
// //                   ),
// //                   _Btn(
// //                     txt: '1s',
// //                     onPressed: () {
// //                       widget.advancedPlayer.seek(
// //                         Duration(seconds: audioPosition.inSeconds + 1),
// //                       );
// //                       setState(() => seekDone = false);
// //                     },
// //                   ),
// //                   _Btn(
// //                     txt: '1.5s',
// //                     onPressed: () {
// //                       widget.advancedPlayer.seek(
// //                         Duration(
// //                           milliseconds: audioPosition.inMilliseconds + 1500,
// //                         ),
// //                       );
// //                       setState(() => seekDone = false);
// //                     },
// //                   ),
// //                 ],
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               ),
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               const Text('Rate'),
// //               Row(
// //                 children: [0.5, 1.0, 1.5, 2.0, 5.0].map((e) {
// //                   return _Btn(
// //                     txt: e.toString(),
// //                     onPressed: () {
// //                       widget.advancedPlayer.setPlaybackRate(playbackRate: e);
// //                     },
// //                   );
// //                 }).toList(),
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               ),
// //             ],
// //           ),
// //           Text('Audio Position: $audioPosition'),
// //           if (seekDone != null) Text(seekDone! ? 'Seek Done' : 'Seeking...'),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _Tab extends StatelessWidget {
// //   final List<Widget> children;

// //   const _Tab({Key? key, required this.children}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Container(
// //         alignment: Alignment.topCenter,
// //         padding: const EdgeInsets.all(16.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: children
// //                 .map(
// //                   (w) => Container(
// //                     child: w,
// //                     padding: const EdgeInsets.all(6.0),
// //                   ),
// //                 )
// //                 .toList(),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _Btn extends StatelessWidget {
// //   final String txt;
// //   final VoidCallback onPressed;

// //   const _Btn({Key? key, required this.txt, required this.onPressed})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return ButtonTheme(
// //       minWidth: 48.0,
// //       child: ElevatedButton(child: Text(txt), onPressed: onPressed),
// //     );
// //   }
// // }

// // // import 'package:audioplayers/audioplayers.dart';
// // // import 'package:flutter/material.dart';

// // // void main() => runApp(MyApp());

// // // class MyApp extends StatefulWidget {
// // //   @override
// // //   _MyAppState createState() => _MyAppState();
// // // }

// // // class _MyAppState extends State<MyApp> {
// // //   late AudioPlayer player = AudioPlayer();
// // //   late AudioPlayer player2 = AudioPlayer();

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     player = AudioPlayer();
// // //     player2 = AudioPlayer();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     player.dispose();
// // //     player2.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         body: Center(
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               ElevatedButton(
// // //                 onPressed: () async {
// // //                   await player.play('assets/audios/tryagain.mp3',
// // //                       isLocal: true);
// // //                   // final url =
// // //                   //     'https://www.applesaucekids.com/sound%20effects/moo.mp3';
// // //                   // await player.setUrl(url);
// // //                   // player.play();
// // //                 },
// // //                 child: Text('Cow'),
// // //               ),
// // //               SizedBox(width: 10),
// // //               ElevatedButton(
// // //                 onPressed: () async {
// // //                   await player2.play('assets/audio/excellent.mp3',
// // //                       isLocal: true);
// // //                   // final url =
// // //                   //     'https://www.applesaucekids.com/sound%20effects/horse_whinney_2.mp3';
// // //                   // await player.setUrl(url);
// // //                   // player2.play();
// // //                 },
// // //                 child: Text('Horse'),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // // // import 'package:flutter/material.dart';
// // // // // import 'package:';

// // // // void main() => runApp(MyApp());

// // // // class MyApp extends StatefulWidget {
// // // //   @override
// // // //   _MyAppState createState() => _MyAppState();
// // // // }

// // // // class _MyAppState extends State<MyApp> {
// // // //   late AudioPlayer player;
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     player = AudioPlayer();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     player.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: Scaffold(
// // // //         body: Center(
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               ElevatedButton(
// // // //                 onPressed: () async {
// // // //                   await player.setAsset('assets/audio/cow.mp3');
// // // //                   player.play();
// // // //                 },
// // // //                 child: Text('Cow'),
// // // //               ),
// // // //               SizedBox(width: 10),
// // // //               ElevatedButton(
// // // //                 onPressed: () async {
// // // //                   await player.setAsset('assets/audio/horse.mp3');
// // // //                   player.play();
// // // //                 },
// // // //                 child: Text('Horse'),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // import 'package:flutter/material.dart';
// // // // // import 'Games/counting_screen.dart';

// // // // // void main() => runApp(MaterialApp(
// // // // //       home: CountingScreen(),
// // // // //     ));


// // // // // // class CountingScreen extends StatefulWidget {
// // // // // //   const CountingScreen({Key? key}) : super(key: key);

// // // // // //   @override
// // // // // //   _CountingScreenState createState() => _CountingScreenState();
// // // // // // }

// // // // // // class _CountingScreenState extends State<CountingScreen> {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Center(
// // // // // //         child: InstanceOfGame(
// // // // // //       numberOfCards: 4,
// // // // // //     ));
// // // // // //   }
// // // // // // }

// // // // // // class InstanceOfGame extends StatelessWidget {
// // // // // //   final List<Image> imgs = [
// // // // // //     Image.asset('assets/images/bird.png'),
// // // // // //     Image.asset('assets/images/monkey.png'),
// // // // // //     Image.asset('assets/images/owls.png')
// // // // // //   ];

// // // // // //   final int numberOfCards;
// // // // // //   InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Column(
// // // // // //       mainAxisSize: MainAxisSize.max,
// // // // // //       verticalDirection: VerticalDirection.down,
// // // // // //       textDirection: TextDirection.ltr,
// // // // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // // // //       children: <Widget>[
// // // // // //         for (var i = 0; i < numberOfCards; i++)
// // // // // //           Flexible(
// // // // // //             flex: 1,
// // // // // //             child: Container(
// // // // // //               padding: EdgeInsets.only(left: 100 * (i % 2).toDouble()),
// // // // // //               child: Alpha(
// // // // // //                 img: imgs[1],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         Options(4)
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class Alpha extends StatelessWidget {
// // // // // //   final Image img;
// // // // // //   Alpha({Key? key, required this.img}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return img;
// // // // // //   }
// // // // // // }

// // // // // // class Options extends StatelessWidget {
// // // // // //   final int rightAnswer;
// // // // // //   Options(this.rightAnswer);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       child: Row(
// // // // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // // // //         mainAxisSize: MainAxisSize.max,
// // // // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //         textDirection: TextDirection.ltr,
// // // // // //         verticalDirection: VerticalDirection.down,
// // // // // //         textBaseline: TextBaseline.alphabetic,
// // // // // //         children: [
// // // // // //           Card(
// // // // // //             shape: RoundedRectangleBorder(
// // // // // //                 borderRadius: BorderRadius.circular(0),
// // // // // //                 side: BorderSide(
// // // // // //                   color: Colors.black,
// // // // // //                 )),
// // // // // //             child: Center(
// // // // // //               child: Container(
// // // // // //                   height: 80,
// // // // // //                   width: 80,
// // // // // //                   color: Colors.blue,
// // // // // //                   padding: EdgeInsets.all(2.0),
// // // // // //                   child: Center(
// // // // // //                     child: Text(
// // // // // //                       (rightAnswer * 2).toString(),
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       textAlign: TextAlign.center,
// // // // // //                       style: TextStyle(fontSize: 50),
// // // // // //                     ),
// // // // // //                   )),
// // // // // //             ),
// // // // // //           ),
// // // // // //           Card(
// // // // // //             child: Center(
// // // // // //                 child: Container(
// // // // // //                     height: 80,
// // // // // //                     width: 80,
// // // // // //                     color: Colors.blue,
// // // // // //                     padding: EdgeInsets.all(2.0),
// // // // // //                     child: Center(
// // // // // //                       child: Text(
// // // // // //                         (rightAnswer + 2).toString(),
// // // // // //                         textDirection: TextDirection.ltr,
// // // // // //                         textAlign: TextAlign.center,
// // // // // //                         style: TextStyle(fontSize: 50),
// // // // // //                       ),
// // // // // //                     ))),
// // // // // //           ),
// // // // // //           Card(
// // // // // //             shape: RoundedRectangleBorder(
// // // // // //                 borderRadius: BorderRadius.circular(0),
// // // // // //                 side: BorderSide(
// // // // // //                   color: Colors.black,
// // // // // //                 )),
// // // // // //             child: Center(
// // // // // //               child: Container(
// // // // // //                   height: 80,
// // // // // //                   width: 80,
// // // // // //                   color: Colors.blue,
// // // // // //                   padding: EdgeInsets.all(2.0),
// // // // // //                   child: Center(
// // // // // //                     child: Text(
// // // // // //                       (rightAnswer * 1.5).toString(),
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       textAlign: TextAlign.center,
// // // // // //                       style: TextStyle(fontSize: 50),
// // // // // //                     ),
// // // // // //                   )),
// // // // // //             ),
// // // // // //           ),
// // // // // //           Card(
// // // // // //             child: Center(
// // // // // //               child: Container(
// // // // // //                   height: 80,
// // // // // //                   width: 80,
// // // // // //                   color: Colors.blue,
// // // // // //                   padding: EdgeInsets.all(2.0),
// // // // // //                   child: Center(
// // // // // //                     child: Text(
// // // // // //                       (rightAnswer + 3).toString(),
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       textAlign: TextAlign.center,
// // // // // //                       style: TextStyle(fontSize: 50),
// // // // // //                     ),
// // // // // //                   )),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
















// // // // // // import 'package:flutter/material.dart';

// // // // // // void main() => runApp(CountingScreen());

// // // // // // class CountingScreen extends StatefulWidget {
// // // // // //   const CountingScreen({Key? key}) : super(key: key);
// // // // // //   @override
// // // // // //   _CountingScreenState createState() => _CountingScreenState();
// // // // // // }

// // // // // // class _CountingScreenState extends State<CountingScreen> {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //         child: Column(
// // // // // //       children: [
// // // // // //         InstanceOfGame(
// // // // // //           numberOfCards: 3,
// // // // // //         ),
// // // // // //         InstanceOfGame(
// // // // // //           numberOfCards: 2,
// // // // // //         ),
// // // // // //       ],
// // // // // //     ));
// // // // // //   }
// // // // // // }

// // // // // // class InstanceOfGame extends StatelessWidget {
// // // // // //   final List<Image> imgs = [
// // // // // //     Image.asset('assets/images/bird.png'),
// // // // // //     Image.asset('assets/images/monkey.png'),
// // // // // //     Image.asset('assets/images/owls.png')
// // // // // //   ];
// // // // // //   // imgs.add();
// // // // // //   final int numberOfCards;
// // // // // //   InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Column(
// // // // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //       children: <Widget>[
// // // // // //         for (var i = 0; i < numberOfCards; i++)
// // // // // //           Alpha(
// // // // // //             img: imgs[1],
// // // // // //           ),
// // // // // //         Options(rightAnswer: numberOfCards)
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class Alpha extends StatelessWidget {
// // // // // //   final Image img;
// // // // // //   Alpha({Key? key, required this.img}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return img;
// // // // // //   }
// // // // // // }

// // // // // // class Options extends StatelessWidget {
// // // // // //   final int rightAnswer;
// // // // // //   const Options({Key? key, required this.rightAnswer}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Row(
// // // // //       // mainAxisAlignment: MainAxisAlignment.start,
// // // // //       // mainAxisSize: MainAxisSize.max,
// // // // //       // crossAxisAlignment: CrossAxisAlignment.center,
// // // // //       // textDirection: TextDirection.ltr,
// // // // //       // verticalDirection: VerticalDirection.down,
// // // // //       // textBaseline: TextBaseline.alphabetic,
// // // // // //       // ignore: prefer_const_literals_to_create_immutables
// // // // // //       children: [
// // // // // //         const Card(
// // // // // //           color: Colors.red,
// // // // // //           shape: RoundedRectangleBorder(),
// // // // // //           child: Center(
// // // // // //             child: Text(
// // // // // //               "Right Answer",
// // // // // //               textDirection: TextDirection.ltr,
// // // // // //             ),
// // // // // //           ),
// // // // // //         )
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }