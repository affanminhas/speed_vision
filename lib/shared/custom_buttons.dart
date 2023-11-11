import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/typography.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double verticalMargin;
  final double horizontalMargin;
  final double? height;
  final FontWeight? fontWeight;
  final double radius;
  final TextStyle? textStyle;
  final double? width;
  final bool isBoxShadow;
  final Icon? icon;
  final bool isTitle;
  final String? assetIcon;
  final bool isTextWithIcon;
  final bool isAssetIcon;
  final Color? outlinedBorderColor;

  const CustomElevatedButton({
    Key? key,
    this.radius = 12,
    this.textStyle,
    this.isTitle = true,
    this.title = '',
    this.isTextWithIcon = false,
    this.isAssetIcon = false,
    this.icon = const Icon(Icons.arrow_forward_ios),
    required this.onPressed,
    this.isBoxShadow = false,
    this.assetIcon,
    this.fontWeight = FontWeight.w400,
    this.verticalMargin = 0,
    this.horizontalMargin = 0,
    this.height = 50,
    this.textColor = Colors.white,
    this.width,
    this.backgroundColor,
    this.outlinedBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      //decoration: BoxDecoration(boxShadow: isBoxShadow ? [AppStyles.elevatedBtnShadow] : null),
      margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: outlinedBorderColor != null ? BorderSide(color: outlinedBorderColor!, width: 1) : BorderSide.none,
          backgroundColor: backgroundColor ?? ColorPalette.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isTitle
                ? Text(title!, style: textStyle ?? interRegular)
                : isAssetIcon
                    ? Image.asset(assetIcon!, height: 20, width: 20)
                    : icon!,
            isTextWithIcon
                ? Row(
                    children: [
                      const SizedBox(width: 5),
                      isTextWithIcon
                          ? Text(title!, style: textStyle ?? interRegular)
                          : isAssetIcon
                              ? Image.asset(assetIcon!, height: 20, width: 20)
                              : icon!
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lefMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final TextStyle? textStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;

  const CustomTextButton(
      {Key? key,
      required this.text,
      this.textAlign,
      this.lefMargin = 0,
      this.rightMargin = 0,
      this.topMargin = 0,
      this.textStyle,
      this.bottomMargin = 0,
      this.decoration,
      required this.onPressed,
      this.textColor = Colors.black,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: lefMargin!, right: rightMargin!, top: topMargin!, bottom: bottomMargin!),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
        ),
        child: Text(
          text,
          textAlign: textAlign ?? TextAlign.center,
          style: textStyle ?? interRegular,
        ),
      ),
    );
  }
}
