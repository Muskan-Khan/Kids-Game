import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';

// import 'package:kids_game/HomeScreen/background.dart';
import 'package:kids_game/Games/games_background.dart';

class CountingScreen extends StatefulWidget {
  const CountingScreen({Key? key}) : super(key: key);

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  var random = Random();
  final min = 1;
  final max = 15;
  void change() {
    setState(() {
      InstanceOfGame(numberOfCards: min + random.nextInt(max - min));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        GameBackground(),
        Container(
          margin: EdgeInsets.only(top: 30.0),
          child: const Material(
            type: MaterialType.transparency,
            child: Text(
              "Game Name",
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: 50,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: InstanceOfGame(
              numberOfCards: (min + random.nextInt(max - min)),
            ),
          ),
        )
      ]),
    );
  }
}

class InstanceOfGame extends StatelessWidget {
  final List<Image> imgs = [
    Image.asset('assets/images/apple.png'),
    Image.asset('assets/images/boyOnly.png'),
    Image.asset('assets/images/kinnows.png'),
    Image.asset('assets/images/durian.png'),
    Image.asset('assets/images/car.png'),
    Image.asset('assets/images/bird.png'),
    // Image.asset('assets/images/monkey.png'),
    // Image.asset('assets/images/owls.png'),
    // Image.asset('assets/images/apple.png'),
    // Image.asset('assets/images/boyOnly.png'),
    // Image.asset('assets/images/kinnows.png'),
    // Image.asset('assets/images/durian.png'),
    // Image.asset('assets/images/car.png'),
    // Image.asset('assets/images/bird.png'),
    // Image.asset('assets/images/monkey.png'),
    // Image.asset('assets/images/owls.png'),
    Image.asset('assets/images/lion.png'),
    Image.asset('assets/images/lemon.png'),
    Image.asset('assets/images/hotAirBaloon.png'),
    Image.asset('assets/images/applewithleaves.png'),
    Image.asset('assets/images/blackGrapes.png'),
    Image.asset('assets/images/cane.png'),
    Image.asset('assets/images/cat.png'),
    Image.asset('assets/images/catonchair.png'),
    Image.asset('assets/images/drone1.png'),
    Image.asset('assets/images/drone2.png'),
    Image.asset('assets/images/drone3.png'),
    Image.asset('assets/images/grapes.png'),
    Image.asset('assets/images/helicopter.png'),
    Image.asset('assets/images/rasberry.png'),
    Image.asset('assets/images/pomegranate.png'),
    Image.asset('assets/images/pear.png')
  ];

  final int numberOfCards;
  InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Row(),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < numberOfCards; i += 3)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height /
                                  (numberOfCards * 1.9),
                              width: MediaQuery.of(context).size.height /
                                  (numberOfCards),
                              margin: EdgeInsets.only(top: i.toDouble()),
                              child: ImagesToBeRendered(
                                img: imgs[numberOfCards],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 1; i < numberOfCards; i += 3)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height /
                                  (numberOfCards * 1.9),
                              width: MediaQuery.of(context).size.height /
                                  (numberOfCards),
                              margin: EdgeInsets.only(
                                left: i.toDouble(),
                              ),
                              child: ImagesToBeRendered(
                                img: imgs[numberOfCards],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 2; i < numberOfCards; i += 3)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height /
                                  (numberOfCards * 1.9),
                              width: MediaQuery.of(context).size.height /
                                  (numberOfCards),
                              margin: EdgeInsets.only(
                                  left: i.toDouble(), bottom: i.toDouble()),
                              child: ImagesToBeRendered(
                                img: imgs[numberOfCards],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      Options(numberOfCards),
    ]);
  }
}

class ImagesToBeRendered extends StatelessWidget {
  final Image img;
  const ImagesToBeRendered({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return img;
  }
}

class Options extends StatelessWidget {
  final int _rightAnswer;
  // final int _flag;
  Options(this._rightAnswer);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      textBaseline: TextBaseline.alphabetic,
      children: [
        if (_rightAnswer % 2 == 0) ...[
          DisplayOptionCard(_rightAnswer, _rightAnswer),
          DisplayOptionCard(_rightAnswer + 1, _rightAnswer),
          DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
        ] else if (_rightAnswer % 3 == 0) ...[
          DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer, _rightAnswer),
          DisplayOptionCard(_rightAnswer + 3, _rightAnswer),
          DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
        ] else if (_rightAnswer % 5 == 0) ...[
          DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer + 5, _rightAnswer),
          DisplayOptionCard(_rightAnswer, _rightAnswer),
          DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
        ] else ...[
          DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer, _rightAnswer),
        ]
        // if (_rightAnswer % 2 == 0)
        //   DisplayOptionCard(_rightAnswer, _rightAnswer),
        // DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
        // DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
        // DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
        // if (_rightAnswer % 3 == 0)
        //   DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
        // DisplayOptionCard(_rightAnswer, _rightAnswer),
        // DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
        // DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
      ],
    ));
  }
}

class DisplayOptionCard extends StatelessWidget {
  var random = Random();
  final int _optionValue;
  final int _rightAnswer;
  VideoPlayerController _controller =
      VideoPlayerController.asset("assets/videos/Excellent.mp4");

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/videos/Excellent.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
      });
  }

  // Ensure the first frame is shown after the video is initialized.

  SetState() {
    InstanceOfGame(numberOfCards: 1 + random.nextInt(15 - 1));
  }

  int flag = 0;
  DisplayOptionCard(this._optionValue, this._rightAnswer);

  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: InkWell(
            child: Card(
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    // borderRadius: BorderRadius.all()
                    // circular(50.0),
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      (_optionValue).toString(),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              if (_optionValue == _rightAnswer) {
                SetState();
                //_CountingScreenState setState() => _CountingScreenState();
                //InstanceOfGame(numberOfCards: _rightAnswer);
                VideoPlayer(_controller);
                print('Excellent!');
                flag = 1;
              } else
                print('Try again.');
            }));
  }
}

/*class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/Excellent.mp4");
      ..initialize().then((_){
          _controller.play();
          setState((){});
    });
  }
}
class _BackgroundVideoState extends State<BackgroundVideo> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller =
      VideoPlayerController.asset("assets/videos/Excellent.mp4");

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/videos/Excellent.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();

        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }
}*/
