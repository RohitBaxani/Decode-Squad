import 'package:decode_squad/authentication/Doctor-Signup/signup-doctor.dart';
import 'package:decode_squad/dashboard/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../main.dart';

class LoginScreenDoctor extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailController = TextEditingController();
  TextEditingController licenseCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "MediSpace",
              ),
              Text(
                "MediSpace Login",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
              ),
              SvgPicture.asset(
                "images/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(
                height: 1.0,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 20.0),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    )),
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 1.0,
              ),
              TextField(
                controller: licenseCodeController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "License Code",
                    labelStyle: TextStyle(fontSize: 20.0),
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    )),
                style: TextStyle(fontSize: 22.0),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!emailController.text.contains("@")) {
                      displayToastMessage(
                          "Enter valid Email Address!", context);
                    } else if (licenseCodeController.text.isEmpty) {
                      displayToastMessage(
                          "License code must be atleast 6 characters", context);
                    } else {
                      //_firebaseAuth.signOut();
                      loginAndAuthenticateUser(context);
                      //displayToastMessage("User does not exist", context);
                    }
                    loginAndAuthenticateUser(context);
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.greenAccent.shade400),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: kPrimaryColor)),
                    ),
                  ),
                  child: Container(
                      height: 40,
                      width: 240,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 24.0, fontFamily: "Brand Bold"),
                        ),
                      ))),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreenDoctor(),
                      ),
                    );
                  },
                  child: Text("New Admin? Register Now.")),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailController.text,
                password: licenseCodeController.text)
            .catchError((errMsg) {
      displayToastMessage("Error:" + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) // user created
    {
      //save user info to database
      usersRef.child(firebaseUser.uid);
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreen, (route) => false);
          displayToastMessage("Logged in Successfully!", context);
        } else {
          //error
          _firebaseAuth.signOut();
          displayToastMessage("User does not exist", context);
        }
      });
    } else {
      displayToastMessage("Error cannot Sign In", context);
    }
  }
}
