import 'package:flutter/material.dart';
import 'package:flutter_appme/screens/authentication/register.dart';
import 'package:flutter_appme/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    }
    return Register(toggleView: toggleView);
  }
}
