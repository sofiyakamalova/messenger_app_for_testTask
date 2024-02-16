import 'package:flutter/material.dart';
import 'package:messenger_app/src/core/constants/app_colors.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final double? size;
  final TextAlign? align;

  const CommonTitle({
    Key? key,
    required this.title,
    this.textColor = AppColors.secondMainColor,
    this.fontWeight,
    this.textStyle,
    this.size = 26,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: size,
          fontFamily: 'Baloo2',
          fontWeight: FontWeight.w600),
      textAlign: align,
    );
  }
}
