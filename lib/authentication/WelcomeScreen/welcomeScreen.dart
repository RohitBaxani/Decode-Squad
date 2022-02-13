import 'package:decode_squad/authentication/WelcomeScreen/body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String idScreen = "Welcome";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
