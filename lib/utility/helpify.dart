import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:tinycolor2/tinycolor2.dart';
import '../components/square_button.dart';
import '../config.dart';
import 'ext.dart';

///This class is used to display different alerts
class Helpify {
  static void navigate(BuildContext context, Widget page,
      {Widget? current, bool? route}) {
    final p = PageTransition(
        type: current is Widget
            ? PageTransitionType.leftToRightJoined
            : PageTransitionType.leftToRight,
        duration: const Duration(milliseconds: 400),
        alignment: Alignment.bottomCenter,
        childCurrent: current,
        curve: Curves.easeInOutQuart,
        child: page);
    if (route is bool) {
      Navigator.pushAndRemoveUntil(context, p, (route) => !route.isFirst);
    } else {
      Navigator.push(context, p);
    }
  }

  static setToken(String token, String uid) async {
    var shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
    shared.setString('uid', uid);
  }

  static getToken() async {
    var shared = await SharedPreferences.getInstance();
    return shared.getString('token');
  }

  static getUid() async {
    var shared = await SharedPreferences.getInstance();
    return shared.getString('uid');
  }

  static error(BuildContext context,
      {String? note,
        String? title,
        bool hasBarrier = false,
        FlashPosition position = FlashPosition.top}) {
    return _flash(context,
        title: title,
        backgroundColor: Conf.redBackFlash,
        borderColor: Conf.redFlash,
        hasBarrier: hasBarrier,
        note: note,
        position: position,
        icon:
        """<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M8 14C11.3137 14 14 11.3137 14 8C14 4.68629 11.3137 2 8 2C4.68629 2 2 4.68629 2 8C2 11.3137 4.68629 14 8 14Z" stroke="#EF4444" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M6.66699 6.6665L9.33366 9.33317M9.33366 6.6665L6.66699 9.33317" stroke="#EF4444" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");
  }

  static confirm(BuildContext context,
      {String? note,
        String? title,
        bool actions = true,
        bool hasBarrier = true,
        FlashPosition position = FlashPosition.top}) {
    return _flash(context,
        title: title,
        borderColor: Conf.primaryColor,
        backgroundColor: Conf.primaryColor.lighten(10),
        hasBarrier: hasBarrier,
        note: note,
        actions: actions,
        position: position,
        icon:
        """<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M3.33301 7.99984L6.66634 11.3332L13.333 4.6665" stroke="#16A34A" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");
  }

  static Future success(BuildContext context,
      {String? note,
        String? title,
        bool hasBarrier = false,
        FlashPosition position = FlashPosition.top}) {
    return _flash(context,
        title: title,
        borderColor: Conf.greenFlash,
        backgroundColor: Conf.timerGreen,
        hasBarrier: hasBarrier,
        note: note,
        position: position,
        icon:
        """<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M3.33301 7.99984L6.66634 11.3332L13.333 4.6665" stroke="#16A34A" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");
  }

  static Future info(BuildContext context,
      {String? note,
        String? title,
        bool hasBarrier = false,
        FlashPosition position = FlashPosition.top}) {
    return _flash(context,
        title: title,
        borderColor: Conf.primaryColor,
        backgroundColor: Conf.primaryColor.lighten(10),
        hasBarrier: hasBarrier,
        note: note,
        position: position,
        icon:
        """<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M3.33301 7.99984L6.66634 11.3332L13.333 4.6665" stroke="#16A34A" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");
  }

  static Future warn(BuildContext context,
      {String? note,
        String? title,
        bool actions = false,
        Function? yesOnTap,
        Function? noOnTap,
        bool hasBarrier = false,
        FlashPosition position = FlashPosition.top}) {
    return _flash(context,
        title: title,
        borderColor: Conf.amberTagColor,
        noOnTap: noOnTap,
        yesOnTap: yesOnTap,
        actions: actions,
        backgroundColor: Conf.warnColor,
        hasBarrier: hasBarrier,
        note: note,
        position: position,
        icon:
        """<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M7.9998 6.00016V7.3335M7.9998 10.0002V10.0068M3.33313 12.6668H12.6665C12.884 12.6653 13.0979 12.6106 13.2894 12.5074C13.4809 12.4043 13.6443 12.2558 13.7653 12.075C13.8862 11.8942 13.9611 11.6865 13.9834 11.4701C14.0057 11.2537 13.9747 11.0352 13.8931 10.8335L9.1598 2.66684C9.0445 2.45844 8.87547 2.28473 8.6703 2.16376C8.46513 2.0428 8.23131 1.979 7.99313 1.979C7.75496 1.979 7.52114 2.0428 7.31597 2.16376C7.1108 2.28473 6.94177 2.45844 6.82647 2.66684L2.09313 10.8335C2.0131 11.0306 1.98136 11.2439 2.00057 11.4557C2.01978 11.6675 2.08938 11.8717 2.20357 12.0511C2.31775 12.2305 2.47321 12.3801 2.65695 12.4872C2.8407 12.5943 3.0474 12.6559 3.2598 12.6668" stroke="#F6AD06" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");
  }


  static Future _flash(BuildContext context,
      {required String icon,
        String? note,
        String? title,
        Function? yesOnTap,
        Function? noOnTap,
        bool actions = false,
        required Color backgroundColor,
        required Color borderColor,
        bool hasBarrier = true,
        FlashPosition position = FlashPosition.top}) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 5),
      transitionDuration: const Duration(milliseconds: 300),
      persistent: true,
      barrierDismissible: true,
      barrierBlur: hasBarrier == true ? 2 : 0,
      barrierColor:
      hasBarrier == true ? Colors.black45 : Conf.transparentColor,
      builder: (_, controller) {
        return FlashBar(
          insetAnimationCurve: Curves.easeInOutQuart,
          controller: controller,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Conf.border),
            side: BorderSide(
              width: 0.5.w,
              color: borderColor,),
          ),
          useSafeArea: true,
          margin: EdgeInsets.all(Conf.xlSize),
          position: position,
          behavior: FlashBehavior.floating,
          content: Container(),
          builder:(BuildContext ctx,child){
            return Container(
              height: 9.h,
              width: double.maxFinite,
              padding: Conf.xlEdge,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SquareButton(
                        color: borderColor.withOpacity(0.25),
                        borderRadius: Conf.border / 1.5,
                        child: Transform.scale(
                          scale: 0.5,
                          child: Iconify(
                            icon,
                            color: borderColor,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title ?? 'خطا').bold.h4.darkColor,
                          Text(note ?? '').h5.bold.darkColor,
                        ],
                      ).paddingOnly(right: Conf.xlSize),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => controller.dismiss(),
                        child: Icon(
                          FeatherIcons.x,
                          color: borderColor,
                          size: 5.w,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } ,
        );
      },
    );
  }
}
