import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Referral"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Generate Referral Code",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextField(controller: controller),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                final code = generateCode();

                controller.text = code;
              },
              child: Text("Create New"),
            ),
          ],
        ),
      ),
    );
  }

  String generateCode({
    bool hasLetters = true,
    bool hasNumbers = true,
  }) {
    final length = 11;
    final lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    final lettersUpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';

    String chars = '';
    if (hasLetters) chars += '$lowerCaseLetters$lettersUpperCase';
    if (hasNumbers) chars += '$numbers';
    print(chars);

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }
}
