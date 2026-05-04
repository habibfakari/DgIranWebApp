import 'dart:ui';
import 'package:digiran/utility/ext.dart';
import 'package:digiran/utility/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:intl/intl.dart';
import 'package:digiran/utility/page_transition.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sizer/sizer.dart';

class Conf {
  static int sts = 1;
  static String? token;
  static double? animation;
  static bool internet = false;
  static String BASE_URL = "https://api.safepol.ir/";
  static String SAFEPOL_BASE_URL = "https://api.safepol.ir/";
  static String BLOG_BASE_URL = "https://blog.safepol.ir/";
  static String defaultSound = 'bing.mp3';

// media-query
  static double? w;
  static double? h;
  static double? t;
  static double? s;

  static const MaterialColor mcgpalette0 = MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFEBF0FD),
    100: Color(0xFFCCDAFA),
    200: Color(0xFFABC2F7),
    300: Color(0xFF89AAF3),
    400: Color(0xFF6F97F1),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF4F7DEC),
    700: Color(0xFF4572E9),
    800: Color(0xFF3C68E7),
    900: Color(0xFF2B55E2),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF5685EE;

  static const MaterialColor mcgpalette0Accent = MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFFBCCAFF),
    700: Color(0xFFA2B6FF),
  });
  static const int _mcgpalette0AccentValue = 0xFFEFF2FF;

  static const accentColor = Color.fromRGBO(3, 174, 139, 1.0);
  static var primaryColor = Color.fromRGBO(69, 151, 255, 1.0);
  static var backColor = Color.fromRGBO(13, 8, 106, 1.0);
  static var darkBlueColor = Color.fromRGBO(4, 0, 74, 1);
  static var cardColor = Color.fromRGBO(26, 19, 145, 1);
  static var yellowColor = Color.fromRGBO(239, 182, 28, 1);
  static var textBlueColor = Color(0xFF39A798);
  static const primaryColor2 = Color.fromRGBO(69, 151, 255, 1.0);
  static const errorColor2 = MaterialColor(0xFFf44336, <int, Color>{
    500: Color(0xFFf44336),
  });

  // Color.fromRGBO(79, 78, 167, 1.0);
  static const disableColor = Color.fromRGBO(110, 109, 182, 1.0);
  static const disableButtonColor = Color.fromRGBO(19, 19, 83, 1);
  static const customColor = Color.fromRGBO(110, 109, 182, 1.0);
  static const productUiColor = Color.fromRGBO(255, 200, 179, 1.0);
  static const textProductUiColor = Color.fromRGBO(92, 65, 48, 1.0);
  static const firoozeeiColor = Color.fromRGBO(83, 196, 178, 1.0);
  static const grayColor = Color(0xFFA5A5A5);
  static const grayColor2 = Color(0xFFE8EAEE);
  static const darkGrayColor = Color(0xFF555555);
  static const blackColor = Color(0xFF252525);

  static const greenFlash = Color.fromRGBO(22, 163, 74, 1);
  static const redFlash = Color.fromRGBO(239, 68, 68, 1);
  static const redBackFlash = Color.fromRGBO(253, 233, 233, 1);
  static const timerGreenBorder = Color.fromRGBO(92, 191, 128, 1);
  static const timerGreen = Color.fromRGBO(227, 244, 233, 1);
  static const redTagColor = Color.fromRGBO(241, 96, 96, 1);
  static const amberTagColor = Color.fromRGBO(246, 173, 6, 1);
  static const blueTagColor = Color.fromRGBO(81, 204, 225, 1);


  static double border = Conf.p2w(3.5);
  static double appbarBorder = Conf.p2w(1.75);
  static double squareBorder = Conf.p2w(2);

  static double appBarFontSize = Conf.p2w(6);

  static double searchicon = Conf.p2t(28);
  static double textappbar = Conf.p2t(40) / (3 / 2);
  static double texttitle = Conf.p2t(40);

  // static double drawerpad = Conf.firspp()/1.5;
  static double appbs = h! / 8;
  static double appbh = h! / 8;
  static double boxshadowspreadRadius = 2;
  static double boxshadowblurRadius = 10;
  static const boxshadowcolor = Colors.black;
  static double elevation = 5;

  static double p2w(num p) => ((p * w!) / 100).toDouble();

  static double p2h(num p) => ((p * h!) / 100).toDouble();

  static double p2t(num p) => (p * t!).toDouble();

  static calcWH(BuildContext ctx) {
    Conf.w = MediaQuery.of(ctx).size.width;
    Conf.h = MediaQuery.of(ctx).size.height;
    Conf.t = MediaQuery.of(ctx).textScaleFactor;
  }

//  colors
  static const iconColor = Color.fromRGBO(194, 205, 245, 1);

  // static const primaryColor = Color.fromRGBO(76, 69, 111, 1);
  static const threeColor = Color.fromRGBO(183, 198, 203, 1);
  static const fourColor = Color.fromRGBO(94, 191, 255, 1);
  static const fastColor = Color.fromRGBO(255, 131, 120, 1);
  static const pinkColor = Color.fromRGBO(236, 72, 153, 1);
  static const greenColor = Color.fromRGBO(132, 204, 22, 1);
  static const blueColor = Color.fromRGBO(6, 182, 212, 1);
  static const purpleColor = Color(0XFF6566B0);
  static const orangeColor = Color.fromRGBO(249, 115, 22, 1);
  static const lightColor = Colors.white;
  static const shadowColor = Colors.grey;
  static const transparentColor = Colors.transparent;
  static const errorColor = Color.fromRGBO(248, 73, 96, 1);
  static const doneColor = Color.fromRGBO(2, 192, 118, 1);
  static const backgroundColor = Colors.white;
  static const warnColor = Colors.orangeAccent;
  static const grey = Color.fromRGBO(56, 63, 69, 1);

//  round style
  static final productBorderRadius = BorderRadius.circular(30);
  static final xtraBorderRadius = BorderRadius.circular(24);
  static final threeBorderRadius = BorderRadius.circular(20);
  static final primaryBorderRadius = BorderRadius.circular(8);
  static final secondBorderRadius = BorderRadius.circular(50);
  static final fullBorderRadius = BorderRadius.circular(100);
  static final halfBorderRadius = BorderRadius.circular(5);
  static final menuBorderRadius = BorderRadius.circular(16);
  static final bottomSheetBorderRadius = Radius.circular(20);
  static final rightBorderRadius = BorderRadius.horizontal(right: Radius.circular(16));

//  size for spacing
  static double smSize = Conf.p2w(0.8);
  static double mdSize = smSize * 2;
  static double xlSize = smSize * 4;
  static double xxlSize = smSize * 8;

//  size for icon

//  size for text
  static double vsmText = Conf.p2t(8);
  static double smText = Conf.p2t(11);
  static double mdText = Conf.p2t(14);
  static double lgText = Conf.p2t(16);
  static double xlText = Conf.p2t(18);
  static double xxlText = Conf.p2t(20);

  static TextStyle? display1;
  static TextStyle? display1W6;
  static TextStyle? display2;
  static TextStyle? display3;
  static TextStyle? display4;
  static TextStyle? title;
  static TextStyle? titleW7;
  static TextStyle? subtitle;
  static TextStyle? headline;
  static TextStyle? headlineW6;
  static TextStyle? subheading;
  static TextStyle? subheadingW7;
  static TextStyle? subheadingW6;
  static TextStyle? body1;
  static TextStyle? body2;
  static TextStyle? body2W7;
  static TextStyle? body2W7C4;
  static TextStyle? caption;
  static TextStyle? captionW7;
  static TextStyle? button;

  static textStyle(BuildContext ctx) {
    ThemeData theme = Theme.of(ctx);
    Conf.display1 = theme.textTheme.headlineMedium;
    Conf.display2 = theme.textTheme.displaySmall;
    Conf.display3 = theme.textTheme.displayMedium;
    Conf.display4 = theme.textTheme.displayLarge;
    Conf.title = theme.textTheme.titleLarge;
    Conf.subtitle = theme.textTheme.titleSmall;
    Conf.headline = theme.textTheme.headlineSmall;
    Conf.subheading = theme.textTheme.titleMedium;
    Conf.body1 = theme.textTheme.bodyMedium;
    Conf.body2 = theme.textTheme.bodyLarge;
    Conf.caption = theme.textTheme.bodySmall;
    Conf.button = theme.textTheme.labelLarge;
    Conf.titleW7 = theme.textTheme.titleLarge!.copyWith(
      color: Conf.accentColor,
      fontWeight: FontWeight.w700,
    );
    Conf.subheadingW7 = theme.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w700,
    );
    Conf.subheadingW6 = theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);
    Conf.body2W7 = theme.textTheme.bodyLarge!.copyWith(color: Conf.primaryColor, fontWeight: FontWeight.w700);
    Conf.body2W7C4 = theme.textTheme.bodyLarge!.copyWith(color: Conf.fourColor, fontWeight: FontWeight.w700);
    Conf.display1W6 = theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600);
    Conf.headlineW6 = theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600);
    Conf.captionW7 = theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700);
  }

//  edge size objects
  static var smEdge = EdgeInsets.all(smSize);
  static var mdEdge = EdgeInsets.all(mdSize);
  static var xlEdge = EdgeInsets.all(xlSize);
  static var xxlEdge = EdgeInsets.all(xxlSize);

  static Decoration boxDecoration2({Color? color, Color? shadowColor, bool hasBorder = false, bool hasShadow = true}) {
    return BoxDecoration(
        border: hasBorder == false ? Border.all(color: Conf.transparentColor) : Border.all(color: Colors.grey.shade400),
        color: color ?? Conf.lightColor,
        boxShadow: hasShadow ? [BoxShadow(color: shadowColor ?? Conf.shadowColor, blurRadius: 0.8)] : [],
        borderRadius: Conf.halfBorderRadius);
  }

  static Decoration boxDecoration(
      {Color? color, Color? backColor, BorderRadiusGeometry? brRadius, double? borderWith}) {
    return BoxDecoration(
        color: backColor ?? Colors.white,
        borderRadius: brRadius ?? Conf.halfBorderRadius,
        border: Border.all(color: color ?? Colors.grey.shade200, width: borderWith ?? 1));
  }

  static Color getColor({Color? color}) {
    return color!.computeLuminance() < 0.5 ? Colors.white : Colors.black;
  }

  static PageTransition pageTrans(Widget page, {Widget? current}) {
    if (current is Widget) {
      return PageTransitionA(child: page, type: PageTransitionType.leftToRightJoined);
    }
    return PageTransitionA(child: page, type: PageTransitionType.leftToRight);
  }

  static ButtonStyle get outlineButtonStyle {
    return ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          fontFamily: 'kalameh',
        )),
        shadowColor: MaterialStateProperty.all(Conf.primaryColor),
        side: MaterialStateProperty.all(BorderSide(color: Conf.primaryColor)),
        padding: MaterialStateProperty.all(EdgeInsets.all(16)),
        foregroundColor: MaterialStateProperty.all(Conf.primaryColor));
  }

  static ButtonStyle get elevatedButtonStyle {
    return ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          fontFamily: 'kalameh',
        )),
        shadowColor: MaterialStateProperty.all(Conf.primaryColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(16)),
        backgroundColor: MaterialStateProperty.all(Conf.primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white));
  }

  static ButtonStyle get primaryBtnStyle {
    return ElevatedButton.styleFrom(
        backgroundColor: Conf.primaryColor,
        padding: EdgeInsets.all(8),
        textStyle: TextStyle(
          fontFamily: 'kalameh',
        ),
        shape: RoundedRectangleBorder(borderRadius: Conf.halfBorderRadius));
  }

  static InputDecoration get iDeco {
    return InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: Conf.fullBorderRadius,
        borderSide: BorderSide(color: Conf.grey.withOpacity(0.1)),
      ),
      contentPadding: EdgeInsets.all(10),
      hintStyle: TextStyle(fontSize: 12.sp),
      enabledBorder: OutlineInputBorder(
          gapPadding: 16,
          borderRadius: Conf.fullBorderRadius,
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))),
    );
  }

  static final String imagePlaceholder = 'assets/img/empty.jpg';
  static final String imagePlaceholder2 = 'assets/img/empty.jpg';

  static Widget divider({Color? color, double? thickness, double? height}) => Divider(
        color: color ?? Conf.shadowColor,
        height: height ?? Conf.p2w(2.5),
        thickness: thickness,
      );

  static Widget verticalDivider({Color? color}) => VerticalDivider(
        color: color ?? Conf.shadowColor,
        width: Conf.p2w(5),
      );

  static Widget loadingWidget({double? width, double? height}) {
    return Container(
      height: height ?? Conf.p2w(7),
      width: width ?? Conf.p2w(7),
      child: CircularProgressIndicator(
        strokeWidth: Conf.p2w(1),
        backgroundColor: Conf.primaryColor,
        color: Conf.lightColor,
      ),
    );
  }

  static Widget reciveLoading({String? title, bool hasWhiteColor = false, bool hasRow = false}) {
    return Center(
      child: hasRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: ThemeData(hintColor: Conf.lightColor),
                  child: Container(
                    height: Conf.p2w(6),
                    width: Conf.p2w(6),
                    child: CircularProgressIndicator(
                      strokeWidth: Conf.p2w(1),
                      backgroundColor: Conf.primaryColor,
                      color: Conf.lightColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: Conf.xlSize),
                  child: hasWhiteColor
                      ? Text(title ?? 'در حال دریافت اطلاعات ...').h5.bold.lightColor
                      : Text(title ?? 'در حال دریافت اطلاعات ...').h5.bold.greyColor,
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: ThemeData(hintColor: Conf.lightColor),
                  child: Container(
                    height: Conf.p2w(6),
                    width: Conf.p2w(6),
                    child: CircularProgressIndicator(
                      strokeWidth: Conf.p2w(1),
                      backgroundColor: Conf.primaryColor,
                      color: Conf.lightColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Conf.xlSize),
                  child: hasWhiteColor
                      ? Text(title ?? 'در حال دریافت اطلاعات ...').h5.bold.lightColor
                      : Text(title ?? 'در حال دریافت اطلاعات ...').h5.bold.greyColor,
                )
              ],
            ),
    );
  }

  static Widget loadingOnButtonWidget({String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title ?? 'در حال ارسال اطلاعات').bold.h5,
        Padding(
          padding: EdgeInsets.only(right: Conf.xlSize),
          child: Theme(
            data: ThemeData(hintColor: Conf.lightColor),
            child: Container(
              height: Conf.p2w(5),
              width: Conf.p2w(5),
              child: CircularProgressIndicator(
                strokeWidth: Conf.p2w(1),
                backgroundColor: Conf.primaryColor,
                color: Conf.lightColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget circularProgressIndicator({bool hasColor = true}) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: hasColor ? Colors.black.withOpacity(0.3) : Conf.transparentColor,
        alignment: Alignment.center,
        child: Container(
//          height: Conf.p2w(15),width: Conf.p2w(18),
//            margin: EdgeInsets.only(top: Conf.p2w(65),left: Conf.p2w(41)),
//          decoration: BoxDecoration(
//              color: Conf.accentColor.withOpacity(0.8),
//              borderRadius: Conf.halfBorderRadius
//          ),
//          alignment: Alignment.center,
          child: CircularProgressIndicator(
            strokeWidth: Conf.p2w(1),
            backgroundColor: Conf.primaryColor,
          ),
        ));
  }

  static Widget loadingLayer() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.3),
      alignment: Alignment.center,
    );
  }

//  static Widget defaultAppbar(dynamic context, {String title, List<Widget> action, Widget leading, bool backButton = true}) {
//    return RoundedFloatingAppBar(
//      actions: action,
//      leading: leading,
//      textTheme: TextTheme(
//        title: TextStyle(
//          color: Colors.black,
//        ),
//      ),
//      pinned: true,
////      floating: true,
////      snap: false,
//      title: Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          backButton
//              ? IconButton(
//              alignment: Alignment.centerRight,
//              icon: Icon(
//                Icons.arrow_back,
//                color: Colors.black,
//              ),
//              onPressed: () => Navigator.of(context).pop())
//              : Container(),
//          Padding(
//            padding: EdgeInsets.symmetric(vertical: Conf.mdSize),
//            child: Text(
//              title ?? '',
//              style: Conf.title,
//            ),
//          ),
//        ],
//      ),
//      backgroundColor: Conf.lightColor,
//    );
//  }
//
//  static DialogButton okAlertButton(dynamic ctx, {String titleButton, Function onPress, Color color}) {
//    return DialogButton(
//      child: Text(
//        titleButton ?? Str.OK,
//        style: TextStyle(color: Colors.white, fontSize: 20),
//      ),
//      onPressed: onPress ??
//              () {
//            Navigator.of(ctx).pop();
//          },
//      width: 120,
//      color: color ?? Conf.primaryColor,
//    );
//  }

  static InputDecoration textFieldDecoration({IconData? icon, String? hintText, label}) {
    return InputDecoration(
        labelText: label,
        labelStyle: Conf.body1,
        hintText: hintText,
        hintStyle: Conf.caption!.copyWith(fontSize: Conf.lgText),
        focusColor: Conf.primaryColor,
        prefixIcon: icon == null ? null : Icon(icon),
        border: OutlineInputBorder(borderRadius: Conf.secondBorderRadius, gapPadding: 0),
        contentPadding: EdgeInsets.symmetric(vertical: Conf.mdSize, horizontal: Conf.xlSize),
        focusedBorder: OutlineInputBorder(
            borderRadius: Conf.secondBorderRadius, gapPadding: 0, borderSide: BorderSide(color: Conf.primaryColor)));
  }

  static Widget singleTextField(
      {String? hintText,
      labelText,
      TextAlign? textAlign,
      TextInputType? textInput,
      List<TextInputFormatter>? mask,
      Function? validator,
      onSaved}) {
    return Padding(
      padding: EdgeInsets.only(top: Conf.xlSize),
      child: TextFormField(
        onSaved: onSaved,
        inputFormatters: mask,
        // validator: validator,
        style: Conf.subheading!.copyWith(
          fontSize: Conf.mdText * 1.3,
          letterSpacing: 5.0,
        ),
        textInputAction: TextInputAction.done,
        textAlign: textAlign ?? TextAlign.start,
        autofocus: false,
        keyboardType: textInput,
        decoration: Conf.textFieldDecoration(hintText: hintText, label: labelText),
      ),
    );
  }

  static Widget checkBox({bool? value, Function? onChanged}) {
    return Checkbox(
      focusNode: FocusNode(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: value,
      onChanged: (bl) => onChanged!(bl),
      checkColor: Conf.primaryColor,
      hoverColor: Conf.primaryColor,
      activeColor: Conf.accentColor,
      focusColor: Conf.accentColor,
    );
  }

  static InputDecoration iDec({String? hintText, Widget? prefixIcon}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: Conf.halfBorderRadius,
      ),
      filled: true,
      hintText: hintText,
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.only(top: Conf.xlSize, bottom: Conf.xlSize, left: Conf.xlSize, right: Conf.xlSize + 3),
      labelStyle: TextStyle(fontSize: Conf.xlText, fontWeight: FontWeight.w900),
      fillColor: Conf.lightColor,
      isDense: true,
    );
  }

  static String priceString(dynamic number, {int? showDecimalDigits}) {
    return NumberFormat.currency(
            symbol: '', decimalDigits: showDecimalDigits ?? (number.toString().split('.').last.length == 2 ? 2 :0))
        .format(number);
  }

  static Widget priceFormatterEn(num price, Color color, {bool unitPrice = false, double? fontSize}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        unitPrice
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Conf.mdSize),
                child: Text(
                  '\$',
                  style: TextStyle(fontFamily: ''),
                ).bold.h5.color(color),
              )
            : Container(),
        Text(
          NumberFormat.currency(symbol: '', decimalDigits: 0).format(price),
          style: TextStyle(fontWeight: FontWeight.w700, color: color, fontFamily: ''
              // state.cl,
              ),
        ).h4,
      ],
    );
  }

  static Widget priceFormatter(num price, Color color, {bool unitPrice = false, double? fontSize}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          NumberFormat.currency(symbol: '', decimalDigits: 0).format(price),
          style: TextStyle(fontWeight: FontWeight.w700, color: color
              // state.cl,
              ),
        ).h4,
        unitPrice
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Conf.mdSize),
                child: Text('ریال', style: Conf.body2W7?.copyWith(color: color)),
              )
            : Container()
      ],
    );
  }

  static getValidator(BuildContext context, bool required,
      {bool characterRange = false, bool zipCode = false, bool email = false}) {
    if (required && characterRange == false && zipCode == false && email == false) {
      return FormBuilderValidators.compose([FormBuilderValidators.required(errorText: 'فیلد اجباری می باشد')]);
    } else if (required && characterRange == true && zipCode == false && email == false) {
      return FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'وارد کردن این مقدار الزامی است.'),
        FormBuilderValidators.numeric(errorText: 'کاراکتر های وارد شده عدد باید باشد'),
        FormBuilderValidators.minLength(11, errorText: 'تعداد کاراکتر های ورودی 11 کاراکتر باید باشد'),
        FormBuilderValidators.maxLength(11, errorText: 'تعداد کاراکتر های ورودی 11 کاراکتر باید باشد'),
      ]);
    } else if (required && zipCode == true && characterRange == false && email == false) {
      return FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'وارد کردن این مقدار الزامی است.'),
        FormBuilderValidators.numeric(errorText: 'کاراکتر های وارد شده عدد باید باشد'),
        FormBuilderValidators.minLength(10, errorText: 'تعداد کاراکتر های ورودی 10 کاراکتر باید باشد'),
        FormBuilderValidators.maxLength(10, errorText: 'تعداد کاراکتر های ورودی 10 کاراکتر باید باشد'),
      ]);
    } else if (required && email == true && zipCode == false && characterRange == false) {
      return FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'وارد کردن این مقدار الزامی است.'),
        FormBuilderValidators.email(errorText: 'فرمت وارد شده ایمیل باید باشد'),
      ]);
    } else if (required == false && email == true && zipCode == false && characterRange == false) {
      return FormBuilderValidators.compose([
        FormBuilderValidators.email(errorText: 'فرمت وارد شده ایمیل باید باشد'),
      ]);
    }
    return FormBuilderValidators.compose(<FormFieldValidator>[]);
  }

  static Widget? image(String? image, {Color? color, BoxFit? fit, bool hasAssetSvg = false, hasAssetImg = false}) {
    try {
      if (image != null && image.contains('.svg')) {
        return svgImage(color: color, image, hasAsset: hasAssetSvg, fit: fit);
      } else {
        if (image == null) {
          return Image.asset(
            'assets/img/empty.jpg',
            fit: fit ?? BoxFit.cover,
          );
        } else {
          if (hasAssetImg) {
            return Image.asset(
              image,
              fit: fit ?? BoxFit.cover,
            );
          } else {
            return FadeInImage.assetNetwork(
              image: image,
              placeholder: Conf.imagePlaceholder,
              fit: fit ?? BoxFit.cover,
            );
          }
        }
      }
    } catch (e) {
      print('eConf.image ===> ${e}');
    }
  }

  static ImageProvider? imageProvider(image) {
    try {
      if (image == null) {
        return AssetImage(
          'assets/img/empty.jpg',
        );
      } else {
        return FileImage(image);
      }
    } catch (e) {
      print('eConf.imageProvider ===> ${e}');
    }
  }

  static Widget? svgImage(String? image, {Color? color, BoxFit? fit, bool hasAsset = false}) {
    try {
      if (image == null) {
        return SvgPicture.asset(
          'assets/img/login_image.svg',
          fit: fit ?? BoxFit.cover,
        );
      } else {
        if (hasAsset) {
          return SvgPicture.asset(
            image,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        } else {
          return SvgPicture.network(image, fit: fit ?? BoxFit.cover);
        }
      }
    } catch (e) {
      print('eSvgImageConf.image ===> ${e}');
    }
  }

  static String persianDate({String? date}) {
    String perDate = '';
    Jalali pDate = Jalali.fromDateTime(DateTime.parse(date ?? ''));
    // PersianDate pDate = PersianDate.pDate(gregorian: date);
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
        pDate.year.toString() +
            '-' +
            pDate.month.toString() +
            '-' +
            pDate.day.toString() +
            ' ' +
            pDate.hour.toString() +
            ':' +
            pDate.minute.toString() +
            ":" +
            pDate.second.toString(),
        true);
    var dateLocal = dateTime.toLocal();
    // if(dateLocal.month < 7){
    //   dateLocal = dateLocal.add(Duration(hours: 1));
    // }
    perDate = dateLocal.hour.toString() +
        ':' +
        dateLocal.minute.toString() +
        ' - ' +
        dateLocal.year.toString() +
        '/' +
        dateLocal.month.toString() +
        '/' +
        dateLocal.day.toString();

    return perDate;
  }

  static String detectedUnit(String? item) {
    String unit = '';
    switch (item) {
      case null:
        unit = '';
        break;
      case 'meter':
        unit = 'متر';
        break;
      case 'kilometer':
        unit = 'کیلومتر';
        break;
      case 'centimeter':
        unit = 'سانتی متر';
        break;
      case 'millimeter':
        unit = 'میلی متر';
        break;
      case 'inch':
        unit = 'اینچ';
        break;
      case 'foot':
        unit = 'فوت';
        break;
      case 'yard':
        unit = 'یارد';
        break;
      case 'mile':
        unit = 'مایل';
        break;
      case 'nautical_mile':
        unit = 'مایل دریایی';
        break;
      case 'year':
        unit = 'سال';
        break;
      case 'second':
        unit = 'ثانیه';
        break;
      case 'minute':
        unit = 'دقیقه';
        break;
      case 'hour':
        unit = 'ساعت';
        break;
      case 'day':
        unit = 'روز';
        break;
      case 'week':
        unit = 'هفته';
        break;
      case 'month':
        unit = 'ماه';
        break;
      case 'gram':
        unit = 'گرم';
        break;
      case 'kilogram':
        unit = 'کیلوگرم';
        break;
      case 'gram_meter':
        unit = 'گرم متر';
        break;
      case 'milligram':
        unit = 'میلی گرم';
        break;
      case 'ton':
        unit = 'تن';
        break;
      case 'piece':
        unit = 'قطعه';
        break;
      case 'yard':
        unit = 'یارد';
        break;
      case 'pond':
        unit = 'پوند';
        break;
      case 'roll':
        unit = 'رول';
        break;
      case 'liter':
        unit = 'لیتر';
        break;
      case 'cc':
        unit = 'سی سی';
        break;
      case 'cubic_meters':
        unit = 'متر مکعب';
        break;
      case 'farvand':
        unit = 'فروند';
        break;
      case 'n':
        unit = 'ان';
        break;
      case 'case':
        unit = 'مورد';
        break;
      case 'folder':
        unit = 'فولدر';
        break;
      case 'pair':
        unit = 'جفت';
        break;
      case 'system':
        unit = 'سیستم';
        break;
      case 'set':
        unit = 'مجموعه';
        break;
      case 'half_dozen':
        unit = 'نیم دوجین';
        break;
      case 'line':
        unit = 'خط';
        break;
      case 'chain':
        unit = 'رشته';
        break;
      case 'series':
        unit = 'سری';
        break;
    }
    return unit;
  }

  static Widget noFilters(
      {String? text, String? src, BoxFit? fit, Color? color, bool hasAssetSvg = false, hasAssetImg = false}) {
    return Column(
      children: [
        SizedBox(
            width: Conf.p2w(30),
            child: Conf.image(src, fit: fit, color: color, hasAssetSvg: hasAssetSvg, hasAssetImg: hasAssetImg)),
        Padding(
          padding: EdgeInsets.only(top: Conf.xlSize),
          child: Text(text ?? 'فیلتری موجود نمی باشد').h5.bold.greyColor,
        )
      ],
    );
  }

  static Widget circlePointer({bool isActive = false, Color? activeColor, Color? disableColor}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 1.5.w : 1.5.w,
      width: isActive ? 6.w : 1.5.w,
      margin: Conf.smEdge,
      decoration: ShapeDecoration(
          color: isActive ? activeColor ?? Conf.lightColor : disableColor ?? Conf.threeColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }

  static Widget titleSafePol() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 6.w,
          height: 6.w,
          child: Conf.image('assets/img/safepol2.svg', hasAssetSvg: true, fit: BoxFit.scaleDown) ?? Container(),
        ),
        Text('صرافی سیف‌پل').h4.yellowColor.bold.paddingOnly(right: Conf.xlSize),
      ],
    );
  }

  static Map<String, dynamic> filters = {
    "eq": "برابر با",
    "n_eq": "نا برابر با",
    "lt": "کمتر از",
    "gt": "بیشتر از",
    "lte": "کمتر یا مساوی",
    "gte": "بیشتر یا مساوی",
    "like": "شامل",
    "n_like": "نا شامل",
    "in": "در",
    "n_in": "نباشد",
    "bet": "بین",
    "n_bet": "در این بین نباشد",
    "sw": "شروع با",
    "ew": "پایان با",
    "n_ew": "نا پایان با",
    "n_sw": "نا شروع با",
    "exi": "موجود",
    "n_exi": "نا موجود"
  };

  static List TEXT = ["like", "n_like", "sw", "ew", "exi", "n_exi"];

  static List TEXTAREA = ["like", "n_like", "sw", "ew", "exi", "n_exi"];

  static List SELECT = ["eq", "n_eq", "exi", "n_exi"];

  static List COLOR = ["eq", "n_eq", "lt", "lte", "gt", "gte", "exi", "n_exi"];

  static List NUMBER = ["eq", "n_eq", "lt", "lte", "gt", "gte", "exi", "n_exi"];

  static List COMP = ["eq", "n_eq", "lt", "lte", "gt", "gte", "exi", "n_exi"];

  static List STACK = ["eq", "n_eq", "lt", "lte", "gt", "gte", "exi", "n_exi"];

  static List DATE = ["eq", "n_eq", "lt", "lte", "gt", "gte", "exi", "n_exi"];

  static List DATE_TIME = ["eq", "n_eq", "lt", "lte", "gt", "gte", "exi", "n_exi"];

  static List BOOLEAN = ["eq", "exi", "n_exi"];

  static List ARRAY = ["in", "n_in", "exi", "n_exi"];

  static List hidden_value = ["exi", "n_exi"];
}
