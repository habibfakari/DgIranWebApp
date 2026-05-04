import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sizer/sizer.dart';
import '../config.dart';
import 'package:intl/intl.dart';

extension Currency on num {
  String get priceFormat =>
      new NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0)
          .format(this.toInt());

  String get priceUnitFormat =>
      new NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0)
          .format(this.toInt()) +
      '  تومان';
}

extension JalaliFormat on Jalali {
  String get format =>
      '${formatter.wN} ${formatter.d} ${formatter.mN} ${formatter.yyyy}';

  String get formatLite => '${formatter.d}/${formatter.m}/${formatter.yyyy}';
}

extension BoldText on Text {
  TextStyle _getStyle(
          {double? size,
          FontWeight? fw,
          Color? color,
          String? font,
          FontStyle? fontStyle}) =>
      style?.copyWith(
          fontWeight: fw,
          fontSize: size,
          color: color,
          fontFamily: font,
          fontStyle: fontStyle) ??
      TextStyle(
          fontWeight: fw,
          fontSize: size,
          color: color,
          fontFamily: font,
          fontStyle: fontStyle);

  Text get bold => Text(
        data!,
        style: this._getStyle(fw: FontWeight.w600),
      );

  Text get exFat => Text(
        data!,
        style: this._getStyle(fw: FontWeight.w900),
      );

  Text get fat => Text(
        data!,
        style: this._getStyle(fw: FontWeight.w700),
      );

  Text get medium => Text(
        data!,
        style: this._getStyle(fw: FontWeight.w500),
      );

  Text get regular => Text(
        data!,
        style: this._getStyle(fw: FontWeight.w400),
      );

  Text get light => Text(
        data!,
        style: this._getStyle(fw: FontWeight.w100),
      );

  Text get wrap => Text(
        data!,
        softWrap: true,
        style: this._getStyle(),
      );

  Text get maxLine3 => Text(
    data!,
    softWrap: true,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    style: this._getStyle(),
  );

  Text get wrapFalse => Text(
    data!,
    softWrap: false,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: this._getStyle(),
  );

  Text get italic => Text(
        data!,
        style: this._getStyle(fontStyle: FontStyle.italic),
      );

  Text get body => Text(
        data!,
        style: this._getStyle(size: 12.sp),
      );

  Text get xm => Text(
        data!,
        style: this._getStyle(size: 14.sp),
      );

  Text get xs => Text(
        data!,
        style: this._getStyle(size: 12.sp),
      );

  Text get h1 => Text(
        data!,
        style: this._getStyle(size: 25.sp),
      );

  Text get h2 => Text(
        data!,
        style: this._getStyle(size: 21.sp),
      );

  Text get h3 => Text(
        data!,
        style: this._getStyle(size: 18.sp),
      );

  Text get h4 => Text(
        data!,
        style: this._getStyle(size: 15.sp),
      );

  Text get h5 => Text(
        data!,
        style: this._getStyle(size: 12.sp),
      );

  Text get h6 => Text(
        data!,
        style: this._getStyle(size: 9.sp),
      );

  Text get centerText => Text(
    data!,
    style: this._getStyle(),
    textAlign: TextAlign.center,
  );

  Text get pColor =>  Text(
    data!,
    style: this._getStyle(color: Conf.primaryColor),
  );

  Text get rColor => Text(
        data!,
        style: this._getStyle(color: Colors.redAccent),
      );

  Text get greyColor => Text(
        data!,
        style: this._getStyle(color: Conf.grayColor),
      );

  Text get threeColor => Text(
    data!,
    style: this._getStyle(color: Conf.threeColor),
  );

  Text get darkGreyColor => Text(
    data!,
    style: this._getStyle(color: Conf.darkGrayColor),
  );

  Text get darkColor => Text(
        data!,
        style: this._getStyle(color: Color.fromARGB(500, 48, 48, 48)),
      );

  Text get aColor => Text(
        data!,
        style: this._getStyle(color: Conf.accentColor),
      );

  Text get yellowColor => Text(
    data!,
    style: this._getStyle(color: Conf.yellowColor),
  );

  Text get doneColor => Text(
    data!,
    style: this._getStyle(color: Conf.doneColor),
  );

  Text get lightColor => Text(
        data!,
        style: this._getStyle(color: Conf.lightColor),
      );

  Text get lightTrans => Text(
        data!,
        style: this._getStyle(color: Conf.lightColor.withAlpha(180)),
      );

  Text get purpleColor => Text(
    data!,
    style: this._getStyle(color: Conf.purpleColor),
  );

  Text color(Color color) => Text(
        data!,
        style: this._getStyle(color: color),
      );

  Text size({double? size}) {
    if (size is! double) return this;
    return Text(
      data!,
      style: this._getStyle(size: size),
    );
  }

  Text get arial => Text(
        data!,
        style: this._getStyle(font: 'Arial'),
      );
}

extension Pad on Widget {
  Widget pb({size}) => Padding(
      padding: EdgeInsets.only(bottom: size ?? Conf.xlSize), child: this);
}

extension Style on ElevatedButton {
  ElevatedButton pad({double size = 8.0}) {
    return ElevatedButton(
      style: Conf.primaryBtnStyle,
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(size),
        child: child,
      ),
    );
  }

  ElevatedButton border({bool hasBorder = false}) {
    if (!hasBorder) return this;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: Conf.halfBorderRadius,
              side: BorderSide(width: 1, color: Conf.primaryColor))),
      onPressed: onPressed,
      key: key,
      child: child,
    );
  }
}

extension BorderExt on Card {
  Card border({Color? color}) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color ?? Conf.primaryColor, width: 1.5),
          borderRadius: Conf.primaryBorderRadius),
      child: child,
      elevation: elevation,
      shadowColor: shadowColor,
      margin: margin,
      color: this.color,
    );
  }
}
