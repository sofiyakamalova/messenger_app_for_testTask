import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/build_button.dart';
import 'package:messenger_app/src/components/build_text_field.dart';
import 'package:messenger_app/src/core/common_widgets/text_theme.dart';
import 'package:messenger_app/src/core/constants/app_colors.dart';
import 'package:messenger_app/src/services/auth_service/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match!"),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CommonTitle(
                      title: "Let's create a new account !",
                      size: 35,
                      align: TextAlign.center),
                  const SizedBox(height: 25),
                  const SizedBox(height: 25),
                  BuildTextField(
                    controller: emailController,
                    hintText: 'Your email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  BuildTextField(
                    controller: passwordController,
                    hintText: 'New password',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  BuildTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: false,
                  ),
                  const SizedBox(height: 25),
                  BuildButton(onTap: signUp, text: 'SIGN UP'),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('You already have account? '),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondMainColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
