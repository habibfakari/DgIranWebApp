import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../components/raised_button.dart';
import '../config.dart';
import 'ext.dart';

class CustomShowAlertDialog {
  static dialog(BuildContext context,
      {bool success = true,
      bool warn = false,
      String? bodyText,
      String? title,
      String? buttonText,
      Function? onTap,
      bool twoButton = false}) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: IntrinsicHeight(
        child: Container(
          padding: Conf.xlEdge,
          decoration: Conf.boxDecoration(
              backColor: Conf.darkBlueColor, color: Conf.primaryColor, brRadius: Conf.primaryBorderRadius),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: Conf.xxlSize),
                child: success
                    ? Icon(
                        Iconsax.tick_circle,
                        color: Conf.doneColor,
                        size: 16.w,
                      )
                    : warn
                        ? Icon(
                            Iconsax.warning_24,
                            color: Conf.orangeColor,
                            size: 16.w,
                          )
                        : Icon(
                            Iconsax.close_circle,
                            color: Conf.errorColor,
                            size: 16.w,
                          ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Conf.xxlSize),
                child: Text(title ?? '').h4.lightColor.bold.centerText,
              ),
              bodyText == null || bodyText.isEmpty ? Container():Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Conf.xxlSize * 2),
                    child: Text(bodyText ?? '',).h5.lightColor.bold.centerText,
                  ),
                ),
              ),
              twoButton
                  ? Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: MasRaisedButton(
                              text: buttonText ?? 'خیر',
                              hasElevation: false,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: Conf.mdSize)),
                        Expanded(
                          child: SizedBox(
                            child: MasRaisedButton(
                              text: buttonText ?? 'بلی',
                              hasElevation: false,
                              onPressed: () {
                                if (onTap is Function) {
                                  onTap();
                                }
                                Get.back();
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: MasRaisedButton(
                        text: buttonText ?? 'باشه',
                        hasElevation: false,
                        onPressed: () {
                          if (onTap is Function) {
                            onTap();
                          }
                          Get.back();
                          // Navigator.pop(context);
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => errorDialog);
  }
}
