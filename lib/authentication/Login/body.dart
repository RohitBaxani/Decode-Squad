import 'package:decode_squad/authentication/WelcomeScreen/background.dart';
import 'package:decode_squad/authentication/components/roundedInputField.dart';
import 'package:decode_squad/authentication/components/roundedPasswordField.dart';
import 'package:decode_squad/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Brand Bold",
                fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "images/login.svg",
            height: size.height * 0.30,
          ),
          RoundedInputField(
              TextField(
                keyboardType: TextInputType.emailAddress,
              ),
              hintText: "Email Address",
              onChanged: (value) {}),
          RoundedPasswordField(onChanged: (Value) {}),
          SizedBox(height: 50),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  shadowColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                ),
                child: Text("Login",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Brand Bold")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
