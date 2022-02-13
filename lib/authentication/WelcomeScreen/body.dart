import 'package:decode_squad/authentication/Doctor-Signin/login-doctor.dart';
import 'package:decode_squad/authentication/Login/loginScreen.dart';
import 'package:decode_squad/authentication/Signup/signupScreen.dart';
import 'package:decode_squad/authentication/WelcomeScreen/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of the screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Medi-Space",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: "Brand Bold"),
          ),
          SizedBox(height: 63),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreenDoctor(),
                      ),
                    ),
                  },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.greenAccent.shade400)),
              child: Container(
                  height: 40,
                  width: 240,
                  child: Center(
                    child: Text(
                      "Doctor Login",
                      style:
                          TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                    ),
                  ))),
          SizedBox(height: 63),
          SvgPicture.asset(
            "images/login.svg",
            height: size.height * 0.3,
          ),
          SizedBox(height: 63),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    )
                  },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade700)),
              child: Container(
                  height: 40,
                  width: 240,
                  child: Center(
                    child: Text(
                      "User Login",
                      style:
                          TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                    ),
                  ))),
        ],
      ),
    );
  }
}
