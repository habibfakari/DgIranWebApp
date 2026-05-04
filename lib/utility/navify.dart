import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'ext.dart';

class Navify {
  static _getPT({Widget? current, Widget? page, BuildContext? context}) {
    return PageTransition(
        type: current is Widget
            ? PageTransitionType.leftToRightJoined
            : PageTransitionType.leftToRight,
        duration: Duration(milliseconds: 150),
        alignment: Alignment.bottomCenter,
        ctx: context,
        childCurrent: current,
        curve: Curves.easeInOutSine,
        child: page!);
  }

  static void pushAndRemoveUntil(
      BuildContext context, Widget page, RoutePredicate predicate,
      {Widget? current}) {
    Navigator.pushAndRemoveUntil(
        context, _getPT(current: current, page: page, context:context), predicate);
  }

  static void push(BuildContext context, Widget page, {Widget? current}) {
    Navigator.push(context, _getPT(current: current, page: page));
  }

  static void pushReplacement(BuildContext context, Widget page,
      {Widget? current}) {
    Navigator.pushReplacement(context, _getPT(current: current, page: page));
  }
}
