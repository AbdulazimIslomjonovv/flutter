import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPositionedD1Animation extends StatefulWidget {
  const AnimatedPositionedD1Animation({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedD1Animation> createState() => _AnimatedPositionedD1AnimationState();
}

class _AnimatedPositionedD1AnimationState extends State<AnimatedPositionedD1Animation> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            left: Random().nextInt(300).toDouble(),
            width: 100,
            height: 100,
            top: Random().nextInt(600).toDouble(),
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
