import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';

class VerticalSpacing extends SizedBox {
  const VerticalSpacing([double height = 8]) : super(height: height);
}

class HorizontalSpacing extends SizedBox {
  const HorizontalSpacing([double width = 8]) : super(width: width);
}

class HorizontalDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  const HorizontalDivider({Key? key, this.color, this.height, this.thickness, this.indent, this.endIndent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? ColorPalette.blackColor,
      thickness: thickness ?? 1.5,
      height: height ?? 2,
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
    );
  }
}
