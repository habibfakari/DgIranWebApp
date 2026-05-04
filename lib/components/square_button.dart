/// {@category components}

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import '../config.dart';

// ignore_for_file: must_be_immutable

/// This is a square box with full custom style
class SquareButton extends StatelessWidget {
  /// Model of square box
  SquareSizeModel? squareSizeModel;
  /// Enum for size of box
  late SizeButton size;
  /// Icon size
  double? iconSize;
  /// Circular border radius
  double? borderRadius;
  /// Border width size
  double? borderWidth;
  /// Size of box
  double? width;
  /// Border color , Background color, Icon Color
  Color? borderColor, color, iconColor;
  /// Box icon
  IconData? icon;
  /// Child of box
  Widget? child;
  /// On tap method
  VoidCallback? onTap;
  /// Disable shadow
  bool? hasShadow;
  /// Disable support svg icon
  bool? isSvgIcon;
  /// Path of svg icon
  String? svgIcon;
  /// List of box shadow
  List<BoxShadow>? shadow;
  /// Border radius
  BorderRadiusGeometry? brRadius;

  SquareButton(
      {super.key,
        this.brRadius,
        this.squareSizeModel,
        this.borderRadius,
        this.size = SizeButton.medium,
        this.borderColor = Colors.transparent,
        this.color = Colors.transparent,
        this.iconColor = Colors.black,
        this.icon,
        this.iconSize,
        this.shadow,
        this.onTap,
        this.borderWidth,
        this.svgIcon,
        this.width,
        this.isSvgIcon = false,
        this.hasShadow,
        this.child});


  /// Find size of box with enum
  void findSize() {
    switch (size) {
      case SizeButton.medium:
        squareSizeModel = SquareSizeModel(
            width: 12.w,
            height: 12.w,
            size: 10.w,
            border: borderRadius ?? (Conf.border / 2.1));
        break;
      case SizeButton.small:
        squareSizeModel = SquareSizeModel(
            width: 8.w,
            height: 8.w,
            size: 5.w,
            border: borderRadius ?? (Conf.border / 1.6));
        break;
      case SizeButton.smallPlus:
        squareSizeModel = SquareSizeModel(
            width: 10.w,
            height: 10.w,
            size: 5.w,
            border: borderRadius ?? (Conf.border / 1.6));
        break;
      case SizeButton.large:
        squareSizeModel = SquareSizeModel(
            width: 15.w,
            height: 15.w,
            size: 15.w,
            border: borderRadius ?? Conf.border/1.1);
        break;
    }
  }



  /// Detector for make icon with svg or not
  Widget detectWidget() {
    Widget a;
    if (child != null) {
      a = child!;
    } else if (icon != null) {
      a = Icon(
        icon,
        color: iconColor,
        size: iconSize ?? squareSizeModel?.size,
      );
    } else if (isSvgIcon == true && svgIcon != null) {
      a = FractionallySizedBox(
          heightFactor: 0.13.w,
          widthFactor: 0.13.w,
          child: Iconify(
            svgIcon!,
            color: iconColor,
            size: iconSize,
          ));
    } else {
      a = Container();
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    findSize();
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: brRadius ??
            BorderRadius.all(
              Radius.circular(squareSizeModel?.border ?? Conf.border),
            ),
      ),
      child: Container(
        width: width ?? squareSizeModel?.width,
        height: squareSizeModel?.height,
        decoration: BoxDecoration(
          color: color ,
              // ??
              // (!themeChange.darkTheme
              //     ? Conf.lightColor.withOpacity(0.5)
              //     : Conf.grey.withOpacity(0.5)),
          border: Border.all(
              color: borderColor ?? Conf.primaryColor,
                  // ?? (themeChange.darkTheme
                  //     ? Conf.lightColor.withOpacity(0.5)
                  //     : Conf.grey.withOpacity(0.5)),
              width: borderWidth ?? 1),
          borderRadius: brRadius ??
              BorderRadius.all(
                Radius.circular(squareSizeModel?.border ?? Conf.border),
              ),
          boxShadow: hasShadow == true ? shadow : [],
        ),
        child: detectWidget(),
      ),
    );
  }
}

/// Model of Square
class SquareSizeModel {
  double? width, height, border, size;

  SquareSizeModel({this.width, this.height, this.border, this.size});
}

enum SizeButton { small, smallPlus, medium, large }
