import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../utility/ext.dart';

class ShowFlash {
  static dialog(BuildContext context,
      {String? title,
        Widget? icon,
      String? desc,
      bool twoButton = false,
      bool sButton1 = true,
      bool sButton2 = true,
      String? tButton1,
      String? tButton2,
      Function? onTap1,
      Function? onTap2}) {
    // AudioCache audioCache = AudioCache();
    showFlash(
      context: context,
      // A dialog cannot be persistent - must be poppable.
      persistent: true,
      transitionDuration: Duration(milliseconds: 250),
      builder: (context, controller) {
        return Container(
          color: Colors.black.withOpacity(0.7),
          padding: Conf.xxlEdge,
          child: FadeTransition(
            opacity: controller.controller,
            child: AlertDialog(
              backgroundColor: Theme.of(context).cardColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: BorderSide(),
              ),
              contentPadding: Conf.xxlEdge
                  .copyWith(top: Conf.xlSize, bottom: Conf.xlSize),
              title: Center(
                  child: Column(
                    children: [
                      icon ?? Container(),
                      Padding(
                        padding: EdgeInsets.only(bottom: Conf.xlSize),
                        child: Text(
                          title!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ).h4,
                      ),
                    ],
                  )),
              content: Text(
                desc!,
              ).h5,
              actions: twoButton
                  ? [
                TextButton(
                  onPressed: () {
                    if (sButton1 == true) {
                      // await audioPlayer.play(Conf.defaultSoundDesktop, isLocal: true);
                      // var bytes = await (
                      //     await audioCache.load(Conf.defaultSound)).readAsBytes();
                      // audioCache.playBytes(bytes);
                    }
                    if (onTap1 != null) {
                      onTap1();
                    }
                    controller.dismiss();
                  },
                  child: Text(tButton1 ?? '',
                      style: TextStyle(fontSize: Conf.p2t(13))).pColor,
                ),
                TextButton(
                  onPressed: () async {
                    if (sButton2 == true) {
                      // await audioPlayer.play(Conf.defaultSoundDesktop, isLocal: true);
                      // var bytes = await (await audioCache.load(Conf.defaultSound)).readAsBytes();
                      // audioCache.playBytes(bytes);
                    }
                    if (onTap2 != null) {
                      onTap2();
                    }
                    controller.dismiss();
                  },
                  child: Text(tButton2 ?? '',
                      style: TextStyle(fontSize: Conf.p2t(13))).pColor,
                ),
              ]
                  : [
                TextButton(
                  onPressed: () async {
                    controller.dismiss();
                  },
                  child: Text('باشه',
                      style: TextStyle(fontSize: Conf.p2t(13))).pColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
