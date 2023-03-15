import 'package:firebase_verify_with_email_fb_gg/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyD4DfcSKQM5nL5ti5-nq_VybH5FvGFWy_M',
            appId: '1:1096092944858:android:e71e74d62abe4c07a298e3',
            messagingSenderId: '1096092944858',
            projectId: 'eryfi-gg-fb-email'));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
