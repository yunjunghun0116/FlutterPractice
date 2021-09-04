import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult? loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult!.accessToken!.token);
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: signInWithFacebook,
              child: Row(
                children: [Icon(Icons.favorite), Text('FacebookLogin')],
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
