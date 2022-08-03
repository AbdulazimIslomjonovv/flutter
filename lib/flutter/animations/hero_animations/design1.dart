import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class _HeroWidget extends StatelessWidget {
  const _HeroWidget({
    Key? key,
  }) : super(key: key);

  final String photo =
      "https://i.pinimg.com/originals/b5/10/1c/b5101ca3aced1afa053d71572a5bd8ce.jpg";
  final double width = 200;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => _SecondPage(),
                ),
              );
            },
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDesign1Animation extends StatelessWidget {
  const HeroDesign1Animation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const _SecondPage(),
              ),
            );
          },
          child: const _HeroWidget(),
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);
  final String photo =
      "https://i.pinimg.com/originals/b5/10/1c/b5101ca3aced1afa053d71572a5bd8ce.jpg";
  final double width = 400;
  final double height = 400;

  Widget build(BuildContext context) {
    print('second page');
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => const _SecondPage(),
                ),
              );
            },
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
