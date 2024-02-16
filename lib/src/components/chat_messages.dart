import 'package:flutter/material.dart';
import 'package:messenger_app/src/core/constants/app_colors.dart';

class ChatMessages extends StatelessWidget {
  final String message;

  const ChatMessages({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.secondMainColor,
      ),
      child: Text(
        message,
        style: const TextStyle(
            fontSize: 16,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
