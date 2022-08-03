import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class SpringPhysicsD1Animation extends StatefulWidget {
  const SpringPhysicsD1Animation({required this.child, super.key});

final Widget child;

@override
State<SpringPhysicsD1Animation> createState() => _SpringPhysicsD1AnimationState();
}

class _SpringPhysicsD1AnimationState extends State<SpringPhysicsD1Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  Alignment _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    //todo
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    //todo
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    //todo
    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    //todo
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    //todo
    _controller.animateWith(simulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onPanDown: (details) {
          print('down: $details');
          _controller.stop();
        },
        onPanUpdate: (details) {
          print('update: $details');
          setState(() {
            //todo
            _dragAlignment += Alignment(
              details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2),
            );
          });
        },
        onPanEnd: (details) {
          print('end: $details');
          _runAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: Align(
          alignment: _dragAlignment,
          child: Card(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}