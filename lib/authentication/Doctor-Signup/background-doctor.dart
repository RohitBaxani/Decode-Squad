import 'package:flutter/material.dart';
//import 'package:rider_app/Screens/Login/components/';


class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "images/main_top.png",
                  width: size.width * 0.46,
                )
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "images/login_bottom.png",
                  width: size.width * 0.46,
                )
            ),
          ],
        ),

      ),
    );
  }
}