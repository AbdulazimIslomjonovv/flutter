import 'package:flutter/cupertino.dart';

class OpenPageModel {
  final String title;
  final VoidCallback onTap;

  const OpenPageModel({
    required this.onTap,
    required this.title,
  });
}
