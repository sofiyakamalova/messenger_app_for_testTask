import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/build_button.dart';
import 'package:messenger_app/src/components/build_text_field.dart';
import 'package:messenger_app/src/core/common_widgets/text_theme.dart';
import 'package:messenger_app/src/core/constants/app_colors.dart';
import 'package:messenger_app/src/services/auth_service/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
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
                      title: 'Welcome user !',
                      size: 35,
                      align: TextAlign.center),
                  const SizedBox(height: 25),
                  Image.asset(
                    'assets/images/welcome.png',
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(height: 25),
                  BuildTextField(
                    controller: emailController,
                    hintText: 'Your email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  BuildTextField(
                    controller: passwordController,
                    hintText: 'Your password',
                    obscureText: false,
                  ),
                  const SizedBox(height: 25),
                  BuildButton(onTap: signIn, text: 'SIGN IN'),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Not a member? '),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register now',
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
