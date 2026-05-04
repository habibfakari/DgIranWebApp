import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageTransitionA<T> extends PageTransition<T> {
  PageTransitionA({child, type})
      : super(
    type: PageTransitionType.scale,
    child: child,settings: RouteSettings(name: 'aaa',arguments: Offset(10, 15)),
    duration: Duration(milliseconds: 1500),reverseDuration:Duration(milliseconds: 1000) ,
    alignment: Alignment.bottomCenter,
    curve: Curves.easeOutCirc,
  );

// @override
// Widget build(BuildContext context) {
//   return PageTransitionA(child: child,type: type);
// }
}
