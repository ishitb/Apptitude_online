import 'package:flutter/material.dart';

class SlideFromRightPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromRightPageRoute({this.page}) : super(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context,animation,secondaryAnimation,child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(1.0, 0.0),
            ).animate(secondaryAnimation),
            child: child,
          ),
        );
      }
  );
}