import 'package:flutter/material.dart';
import '../config.dart';
import '../utility/ext.dart';

class MasRaisedButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? isFitBox;
  final bool? hasElevation;
  final double? padding;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;

  MasRaisedButton(
      {this.onPressed,
        this.hasElevation = true,
      this.margin,
      this.borderColor,
      this.borderRadius,
      this.child,
      this.text,
      this.padding,
      this.color,
      this.textColor,
      this.isFitBox = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: () {
          if(onPressed != null){
            onPressed!();
          }
        },style: ElevatedButton.styleFrom(padding: EdgeInsets.all(this.padding ?? Conf.xlSize ),backgroundColor: color ?? Conf.primaryColor,
      textStyle: TextStyle(color: textColor ?? Conf.getColor(color: Conf.primaryColor),fontFamily: 'iranYekan'),
      elevation: hasElevation == false ? 0:null,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? Conf.fullBorderRadius,
          side: BorderSide(color: borderColor ?? Conf.transparentColor),
        ),),
        child: (child is Widget)
            ? IntrinsicHeight(child: child)
            : IntrinsicHeight(
                child: Text(text ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        color: textColor ??
                            Conf.getColor(color: Conf.primaryColor),
                        fontWeight: FontWeight.w500,
                      fontFamily: 'iranYekan'
                        ))),
      ),
    );
  }
}
