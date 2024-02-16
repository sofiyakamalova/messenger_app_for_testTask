import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/src/features/chats_page/presentation/chats_page.dart';
import 'package:messenger_app/src/services/auth_service/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ChatsPage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
