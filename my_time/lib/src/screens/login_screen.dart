import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_time/src/components/show_login_bottom_sheet.dart';

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
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Widget _loginButton(
      {required Function onClickedFunc,
      required String imageName,
      required String text}) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green.withOpacity(0.3),
      ),
      child: TextButton(
        onPressed: () {
          onClickedFunc();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/$imageName',
              width: 100,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget _registerButton(
      {required Function onClickedFunc, required String text}) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green.withOpacity(0.3),
      ),
      child: TextButton(
        onPressed: () {
          onClickedFunc();
        },
        child: Text(text),
      ),
    );
  }

  Widget _loginArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _loginButton(
          onClickedFunc: signInWithGoogle,
          imageName: 'google_logo.png',
          text: '구글로그인',
        ),
        _loginButton(
          onClickedFunc: signInWithFacebook,
          imageName: 'facebook_logo.png',
          text: '페이스북로그인',
        ),
        _registerButton(
          onClickedFunc: () {
            Get.bottomSheet(ShowLoginBottomSheet());
          },
          text: '이메일로그인',
        ),
        _registerButton(
          onClickedFunc: () {
            Get.toNamed('/register');
          },
          text: '회원가입하기',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 150,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _loginArea(),
          ),
          Container(
            height: 50,
          )
        ],
      ),
    );
  }
}
