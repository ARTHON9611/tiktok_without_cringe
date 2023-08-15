import 'package:flutter/material.dart';

class circleAnimation extends StatefulWidget {
  final Widget child;
  const circleAnimation({super.key,required this.child});

  @override
  State<circleAnimation> createState() => _circleAnimationState();
}

class _circleAnimationState extends State<circleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 5000));
    controller.forward();
    controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,bottom:8 ),
      child: RotationTransition(turns: Tween(begin: 0.0,end: 1.0).animate(controller),child:widget.child),
    );
  }
}