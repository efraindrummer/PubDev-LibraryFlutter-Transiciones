import 'package:flutter/material.dart';

enum AnimationType{
  normal,
  fadeIn
}

class RouteTransitions {

  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;

  RouteTransitions({
    @required this.context, 
    @required this.child, 
    this.animation = AnimationType.normal,
    this.duration = const Duration( milliseconds: 300 )
  }) {

    switch (this.animation) {
      
      case AnimationType.normal:
        this._normalTransition();
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    }

  }

  void _normalTransition() => Navigator.push(context, MaterialPageRoute(builder: (_) => this.child));

  void _fadeInTransition() {

    final route = PageRouteBuilder(
      pageBuilder: ( _, __, ___ ) => this.child,
      transitionDuration: this.duration,
      transitionsBuilder: ( _, animation, __, child) {
        return FadeTransition(
          child: child,
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut)
          ),
        );
      }
    );

    Navigator.push(context, route);
  }

}