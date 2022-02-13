import 'package:decode_squad/authentication/Signup/body.dart';
import 'package:flutter/material.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Body(),
        ),
      ),
    );
  }
}