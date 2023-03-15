import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_verify_with_email_fb_gg/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                var result = await signInWithGoogle();
                if (result.user != null) {
                  print('gg');
                  print(result.user!.displayName);
                  print(result.user!.email);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const HomePage()));
                } else {
                  const snackBar = SnackBar(content: Text('Error'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Login with Google')),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                var result = await signInWithFacebook();
                if (result.user != null) {
                  print('Facbook');
                  print('result.user!.displayName');
                  print(result.user!.email);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const HomePage()));
                } else {
                  const snackBar =
                      SnackBar(content: Text('Error login Facebook'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Login with Facebook')),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {}, child: const Text('Login with email')),
        ],
      )),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
