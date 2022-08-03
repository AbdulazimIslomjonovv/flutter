import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_by_abdulazim/flutter/animations/hero_animations/design1.dart';
import 'package:flutter_by_abdulazim/flutter/animations/animations_page.dart';

void main() {
  runApp(const Flutter());
}

class Flutter extends StatelessWidget {
  const Flutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationsPage(),
    );
  }
}
