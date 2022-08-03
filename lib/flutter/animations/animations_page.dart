import 'package:flutter/material.dart';
import 'package:flutter_by_abdulazim/flutter/animations/animated_list/d1.dart';
import 'package:flutter_by_abdulazim/flutter/animations/animated_list/d2.dart';
import 'package:flutter_by_abdulazim/flutter/animations/animated_positioned/design1.dart';
import 'package:flutter_by_abdulazim/flutter/animations/carousel/d1.dart';
import 'package:flutter_by_abdulazim/flutter/animations/custom_tween/d1.dart';
import 'package:flutter_by_abdulazim/flutter/animations/hero_animations/design1.dart';
import 'package:flutter_by_abdulazim/flutter/animations/spring_physics/d1.dart';
import 'package:flutter_by_abdulazim/models/pages_model.dart';

import 'card_swipe/d1.dart';
import 'focus_image/d1.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          pagesInfo(null, context, true),
          (index) => MakeCard(index: index, context: context),
        ),
      ),
    );
  }
}

dynamic pagesInfo(int? index, BuildContext context, [bool getLength = false]) {
  final List<OpenPageModel> pages = [
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const HeroDesign1Animation(),
          ),
        );
      },
      title: 'Hero Page Animation',
    ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const AnimatedPositionedD1Animation(),
          ),
        );
      },
      title: 'Animated Position Animation',
    ),
    // OpenPageModel(
    //   onTap: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (c) => const AnimatedListD1Animation(),
    //       ),
    //     );
    //   },
    //   title: 'Animated List Animation',
    // ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const AnimatedListD2Animation(),
          ),
        );
      },
      title: 'Animated List Animation',
    ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const SpringPhysicsD1Animation(
              child: FlutterLogo(
                size: 200,
              ),
            ),
          ),
        );
      },
      title: 'Simulation Physics Animation',
    ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const CardSwipeD1Animation(),
          ),
        );
      },
      title: 'Card Swipe Animation',
    ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const FocusImageD1Animation(),
          ),
        );
      },
      title: 'Focus image Animation',
    ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => CarouselD1Animation(),
          ),
        );
      },
      title: 'Carousel Animation',
    ),
    OpenPageModel(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const CustomTweenD1Animation(),
          ),
        );
      },
      title: 'Custom tween Animation',
    ),
  ];
  if (getLength) {
    return pages.length;
  } else {
    return pages[index!];
  }
}

class MakeCard extends StatelessWidget {
  final int index;
  final BuildContext context;

  const MakeCard({
    Key? key,
    required this.index,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: pagesInfo(index, context).onTap,
        title: Text(pagesInfo(index, context).title),
      ),
    );
  }
}
