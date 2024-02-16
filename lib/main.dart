import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/firebase_options.dart';
import 'package:messenger_app/src/services/auth_service/auth_gate.dart';
import 'package:messenger_app/src/services/auth_service/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ,
      title: 'Messenger App',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
