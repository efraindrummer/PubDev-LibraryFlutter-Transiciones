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
  final bool replacement;

  RouteTransitions({
    @required this.context, 
    @required this.child,
    this.replacement = false,
    this.animation = AnimationType.normal,
    this.duration = const Duration( milliseconds: 300 ),
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

  void _pushPage(Route route) => Navigator.push(context, route);
  void _pushReplacementPage(Route route) => Navigator.pushReplacement(context, route);


  void _normalTransition(){
    
    final route = MaterialPageRoute(builder: (_) => this.child);

    (this.replacement) ? this._pushReplacementPage(route) : this._pushPage(route);

  }

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

    (this.replacement) ? this._pushReplacementPage(route) : this._pushPage(route);
  }

}