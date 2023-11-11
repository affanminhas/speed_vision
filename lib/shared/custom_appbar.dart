import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speed_vision/constant/typography.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    final String? title,
    TextStyle? titleStyle,
    required BuildContext context,
    bool? isBackButtonExist = true,
    final Function? onBackPressed,
    final bool isBackButtonColor = true,
    final bool isBackgroundColor = true,
    final bool showCart = false,
    final bool showSkip = false,
    final Widget? leading,
    double? fontSize = 18,
  }) : super(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          title: Text(
            title ?? '',
            style: titleStyle ?? interRegular.copyWith(fontSize: fontSize, color: Theme.of(context).textTheme.bodyText1?.color),
          ),
          centerTitle: true,
          leading: isBackButtonExist!
              ? Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isBackButtonColor ? const Color(0xffE0E0E0) : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                    onTap: () => onBackPressed != null ? onBackPressed() : Navigator.pop(context),
                  ),
                )
              : leading,
          backgroundColor: isBackgroundColor ? Theme.of(context).cardColor : const Color(0xffFAFAFA),
          elevation: 0,
        );

  @override
  Size get preferredSize => const Size(30, 50);
}
