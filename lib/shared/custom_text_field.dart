import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/typography.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final IconData? suffixIcon;
  final Icon? prefixIcon;
  final Function? onPrefixIconPressed;
  final Function? onSuffixIconPressed;
  final bool isPassword;
  final bool readOnly;
  final Color? fillColor;
  final bool showErrorMessage;
  final String suffixText;
  final Function()? onTap;
  final TextInputType keyBoardType;
  final Function(String?)? validator;
  final double verticalMargin;
  final double horizontalMargin;
  final Color? outlineColor;
  final TextAlign textAlign;
  final double radius;
  final bool isSuffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool isEnable;

  const CustomTextField(
      {Key? key,
      this.hintText,
      this.initialValue,
      this.isEnable = true,
      this.isSuffixIcon = false,
      this.hintStyle,
      this.inputTextStyle,
      this.suffixIcon,
      this.prefixIcon,
      this.onSuffixIconPressed,
      this.onPrefixIconPressed,
      this.outlineColor,
      this.textAlign = TextAlign.start,
      this.isPassword = false,
      this.readOnly = false,
      this.showErrorMessage = true,
      this.horizontalMargin = 0,
      this.verticalMargin = 0,
      this.suffixText = '',
      this.validator,
      this.onTap,
      this.radius = 10,
      this.keyBoardType = TextInputType.text,
      this.inputFormatters = const [],
      this.textInputAction = TextInputAction.next,
      this.fillColor,
      this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      child: TextFormField(
        initialValue: initialValue,
        enabled: isEnable,
        keyboardType: keyBoardType,
        obscuringCharacter: '*',
        validator: (value) => validator!(value),
        scrollPhysics: const BouncingScrollPhysics(),
        style: inputTextStyle ?? interRegular,
        obscureText: isPassword,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        textAlign: textAlign,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          errorStyle: !showErrorMessage ? const TextStyle(height: 0) : null,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.grey, fontFamily: 'Poppins', fontSize: 14),
          suffixText: suffixText,
          suffixIcon: isSuffixIcon
              ? GestureDetector(
                  onTap: () {
                    if (onSuffixIconPressed != null) onSuffixIconPressed!();
                  },
                  child: Icon(suffixIcon),
                )
              : null,
          prefixIcon: prefixIcon,
          filled: true,
          isDense: true,
          fillColor: fillColor ?? ColorPalette.fillColor,
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: const BorderSide(color: Colors.red)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: outlineColor ?? Colors.transparent)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: ColorPalette.primaryColor)),
        ),
      ),
    );
  }
}
