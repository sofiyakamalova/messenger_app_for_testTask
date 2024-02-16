import 'package:flutter/material.dart';
import 'package:messenger_app/src/core/constants/app_colors.dart';

class BuildTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const BuildTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          fillColor: AppColors.fillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.secondMainColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.secondMainColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
