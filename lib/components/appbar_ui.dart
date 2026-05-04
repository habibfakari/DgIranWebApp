import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../config.dart';
import '../utility/ext.dart';

class AppBarUi extends StatefulWidget implements PreferredSizeWidget {
  String? title;
  Widget? leading, trailing2;
  Function? onBackButton;
  bool hasCenter;

  AppBarUi({this.trailing2 ,this.hasCenter= false, this.title, this.leading,this.onBackButton});

  @override
  _AppBarUiState createState() => _AppBarUiState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, Conf.p2w(19));
}

class _AppBarUiState extends State<AppBarUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Conf.xlEdge.copyWith(left: 0,right: 0),
      width: double.infinity,
      // margin: Conf.xlEdge.copyWith(bottom: 0),
      // decoration:
      //     BoxDecoration(color: Conf.lightColor, borderRadius: Conf.halfBorderRadius, boxShadow: [BoxShadow(color: Conf.shadowColor, blurRadius: 4)]),
      child:widget.hasCenter ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(
          widget.title ?? '',
        ).h5.bold,],
      ): Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:widget.trailing2 == null ? <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  highlightColor: Conf.transparentColor,
                  splashColor:Conf.transparentColor,
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: Conf.lightColor,
                  ),
                  padding: EdgeInsets.all(0),
                  onPressed: widget.onBackButton != null ?  () { widget.onBackButton!();} : () => Navigator.pop(context)),
              Text(
                widget.title ?? '',
              ).h5.bold.lightColor,
            ],
          ), widget.leading ?? Container()
        ]: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.trailing2 ?? Container(),
              Text(
                widget.title ?? '',
              ).h5.bold,
            ],
          ), widget.leading ?? Container()
        ],
      ),
    );
  }
}
