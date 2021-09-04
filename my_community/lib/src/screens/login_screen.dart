import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: signInWithGoogle,
              child: Row(
                children: [Icon(Icons.favorite), Text('GoogleLogin')],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [Icon(Icons.favorite), Text('회원가입하기')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
