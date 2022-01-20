import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '';
  String name = '';
  String uid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(email),
          Text(name),
          Text(uid),
          SignInWithAppleButton(
            onPressed: () async {
              try {
                final credential = await SignInWithApple.getAppleIDCredential(
                  scopes: [
                    AppleIDAuthorizationScopes.email,
                    AppleIDAuthorizationScopes.fullName,
                  ],
                );
                final oauthCredential = OAuthProvider("apple.com").credential(
                  idToken: credential.identityToken,
                  accessToken: credential.authorizationCode,
                );

                final authResult = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
                print(authResult.user!.email);
                setState(() {
                  email = authResult.user!.email??'noemail';
                  name = authResult.user!.displayName??'noname';
                  uid = authResult.user!.uid;
                });
              } catch(error) {
                setState(() {
                  email = error.toString();
                });
                return Future<void>.value();
              }
            },
          ),
        ],
      ),
    );
  }
}
