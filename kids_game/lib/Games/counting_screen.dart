import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:video_player/video_player.dart';

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
    int count = 1;
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
          child: GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: InstanceOfGame(
              numberOfCards: (min + random.nextInt(max - min)),
            ),
          ),
        )),
      ]),
    );
  }
}

class InstanceOfGame extends StatefulWidget {
  final int numberOfCards;
  const InstanceOfGame({Key? key, required this.numberOfCards})
      : super(key: key);

  @override
  _InstanceOfGameState createState() => _InstanceOfGameState();
}

class _InstanceOfGameState extends State<InstanceOfGame> {
  @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   _InstanceOfGameState();
  //   super.setState(fn);
  // }

  final List<Image> imgs = [
    Image.asset('assets/images/apple.png'),
    Image.asset('assets/images/boyOnly.png'),
    Image.asset('assets/images/kinnows.png'),
    Image.asset('assets/images/durian.png'),
    Image.asset('assets/images/car.png'),
    Image.asset('assets/images/bird.png'),
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
  void onChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
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
                    for (var i = 0; i < widget.numberOfCards; i += 3)
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards * 1.9),
                                width: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards),
                                margin: EdgeInsets.only(top: i.toDouble()),
                                child: ImagesToBeRendered(
                                  img: imgs[widget.numberOfCards],
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
                    for (var i = 1; i < widget.numberOfCards; i += 3)
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards * 1.9),
                                width: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards),
                                margin: EdgeInsets.only(
                                  left: i.toDouble(),
                                ),
                                child: ImagesToBeRendered(
                                  img: imgs[widget.numberOfCards],
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
                    for (var i = 2; i < widget.numberOfCards; i += 3)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards * 1.9),
                                width: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards),
                                margin: EdgeInsets.only(
                                    left: i.toDouble(), bottom: i.toDouble()),
                                child: ImagesToBeRendered(
                                  img: imgs[widget.numberOfCards],
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
        Options(rightAnswer: widget.numberOfCards),
      ]),
    );
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

class Options extends StatefulWidget {
  final int rightAnswer;

  const Options({Key? key, required this.rightAnswer}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        textBaseline: TextBaseline.alphabetic,
        children: [
          if (widget.rightAnswer % 2 == 0) ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 1,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer),
          ] else if (widget.rightAnswer % 3 == 0) ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 3,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer),
          ] else if (widget.rightAnswer % 5 == 0) ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 5,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer),
          ] else ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer),
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer),
          ]
        ],
      )),
    );
  }
}

class DisplayOptionCard extends StatefulWidget {
  // var random = Random();
  final int optionValue;
  final int rightAnswer;
  const DisplayOptionCard(
      {Key? key, required this.optionValue, required this.rightAnswer})
      : super(key: key);

  @override
  _DisplayOptionCardState createState() => _DisplayOptionCardState();
}

class _DisplayOptionCardState extends State<DisplayOptionCard> {
  int? Value;
  int? Answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
          type: MaterialType.transparency,
          child: InkWell(
              child: Card(
                child: Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        (widget.optionValue).toString(),
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
                setState(() {
                  Value = 20;
                });
                if (widget.optionValue == widget.rightAnswer) {
                  print('Excellent!');
                } else
                  print('Try again.');
              })),
    );
  }
}


// class Options extends StatelessWidget {
//   final int _rightAnswer;
//   Options(this._rightAnswer);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       textDirection: TextDirection.ltr,
//       verticalDirection: VerticalDirection.down,
//       textBaseline: TextBaseline.alphabetic,
//       children: [
//         if (_rightAnswer % 2 == 0) ...[
//           DisplayOptionCard(_rightAnswer, _rightAnswer),
//           DisplayOptionCard(_rightAnswer + 1, _rightAnswer),
//           DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
//           DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
//         ] else if (_rightAnswer % 3 == 0) ...[
//           DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
//           DisplayOptionCard(_rightAnswer, _rightAnswer),
//           DisplayOptionCard(_rightAnswer + 3, _rightAnswer),
//           DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
//         ] else if (_rightAnswer % 5 == 0) ...[
//           DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
//           DisplayOptionCard(_rightAnswer + 5, _rightAnswer),
//           DisplayOptionCard(_rightAnswer, _rightAnswer),
//           DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
//         ] else ...[
//           DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
//           DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
//           DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
//           DisplayOptionCard(_rightAnswer, _rightAnswer),
//         ]
//       ],
//     ));
//   }
// }




// class DisplayOptionCard extends StatelessWidget {
//   var random = Random();
//   final int _optionValue;
//   final int _rightAnswer;
//   DisplayOptionCard(this._optionValue, this._rightAnswer);
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         type: MaterialType.transparency,
//         child: InkWell(
//             child: Card(
//               child: Center(
//                 child: Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black, width: 2),
//                   ),
//                   padding: EdgeInsets.all(2.0),
//                   child: Center(
//                     child: Text(
//                       (_optionValue).toString(),
//                       textDirection: TextDirection.ltr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: MediaQuery.of(context).size.height / 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             onTap: () {
//               setState(() {});
//               if (_optionValue == _rightAnswer) {
//                 print('Excellent!');
//               } else
//                 print('Try again.');
//             }));
//   }
// }

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
