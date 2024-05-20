import 'dart:math' as math;
import 'package:flutter/material.dart';

class SquareProgressIndicator extends StatefulWidget {
  const SquareProgressIndicator({super.key, this.alignment = Alignment.center});

  final AlignmentGeometry alignment;

  @override
  State<SquareProgressIndicator> createState() =>
      _SquareProgressIndicatorState();
}

class _SquareProgressIndicatorState extends State<SquareProgressIndicator>
    with SingleTickerProviderStateMixin {
  static final _positions = <double>[
    0,
    math.pi / 4,
    math.pi / 2,
  ];

  static const _recessDuration = 500;
  static const _animationDuration = 400;

  late final AnimationController _animationController;
  late final Animation<double> _animation;

  int get _fullAnimationDuration =>
      _recessDuration * 2 + _animationDuration * 2;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _fullAnimationDuration),
    )..repeat();

    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: _positions[0], end: _positions[1]).chain(
          CurveTween(curve: Curves.easeOutBack),
        ),
        weight: _animationDuration.toDouble(),
      ),
      TweenSequenceItem(
        tween: Tween(begin: _positions[1], end: _positions[1]),
        weight: _recessDuration.toDouble(),
      ),
      TweenSequenceItem(
        tween: Tween(begin: _positions[1], end: _positions[2]).chain(
          CurveTween(curve: Curves.easeOutBack),
        ),
        weight: _animationDuration.toDouble(),
      ),
      TweenSequenceItem(
        tween: Tween(begin: _positions[2], end: _positions[2]),
        weight: _recessDuration.toDouble(),
      ),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _animation.value,
            child: child,
          );
        },
        child: const SizedBox(
          width: 20,
          height: 20,
          child: ColoredBox(
            // TODO: Задать цвет из темы
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
