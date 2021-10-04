import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveScreen extends StatefulWidget {
  @override
  _RiveScreenState createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  Artboard artBoard;
  RiveAnimationController controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('anim/buggy.riv').then(
      (data) async {
        final riveFile = RiveFile();
        if (riveFile.import(data)) {
          final riveArtBoard = riveFile.mainArtboard;
          riveArtBoard.addController(controller = SimpleAnimation('idle'));
          setState(() => artBoard = riveArtBoard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Rive(artboard: artBoard),
      ),
    );
  }
}
