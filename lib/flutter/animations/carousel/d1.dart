// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';
import 'package:flutter/material.dart';

class CarouselD1Animation extends StatelessWidget {
  CarouselD1Animation({super.key});
  static String routeName = '/misc/carousel';

  static const List<String> fileNames = [
    'https://avatars.mds.yandex.net/i?id=a4ce5620945d72578baddcb1f8d9ded1-6428252-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=fb53505a8dc9520bf51be8655e13dd70-5866271-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=c343dd8a6750f5c0b507bd83fa77d9cc-4593530-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=4e7775d7ea9b2ee32d31d9f89d6e4525-5337988-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=e03ff083a58ab29043be6ff756b4b013-4553981-images-thumbs&n=13',

  ];

  final List<Widget> images =
  fileNames.map((file) => Image.network(file, fit: BoxFit.cover)).toList();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Carousel(itemBuilder: widgetBuilder),
          ),
        ),
      ),
    );
  }

  Widget widgetBuilder(BuildContext context, int index) {
    return images[index % images.length];
  }
}

typedef OnCurrentItemChangedCallback = void Function(int currentItem);

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  const Carousel({super.key, required this.itemBuilder});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  late int _currentPage;
  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(
      viewportFraction: .85,
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          _pageHasChanged = true;
          _currentPage = value;
        });
      },
      controller: _controller,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          var result = _pageHasChanged ? _controller.page! : _currentPage * 1.0;

          // The horizontal position of the page between a 1 and 0
          var value = result - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * size.height,
              width: Curves.easeOut.transform(value) * size.width,
              child: child,
            ),
          );
        },
        child: widget.itemBuilder(context, index),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}