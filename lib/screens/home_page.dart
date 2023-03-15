import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login With Facebook')),
      body: Center(
          child: ElevatedButton(
        child: const Text('Logout'),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          await FacebookAuth.instance.logOut();
          Navigator.pop(context);
        },
      )),
    );
  }
}
