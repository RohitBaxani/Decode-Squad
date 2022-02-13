import 'package:decode_squad/authentication/WelcomeScreen/welcomeScreen.dart';
import 'package:decode_squad/referral-system/referral-main.dart';
import 'package:decode_squad/screens/add_patient_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Brand Bold",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Home Screen'),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPatientPage(),
                ),
              )
            },
            child: Text('Add', style: TextStyle(fontSize: 20.0)),
            style: ElevatedButton.styleFrom(primary: Colors.blue),
          )
        ]),
      ),
      body: Column(
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
                        builder: (context) => AddPatientPage(),
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
                      "Add Patient",
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
                        builder: (context) => WelcomeScreen(),
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
                      "Logout",
                      style:
                          TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                    ),
                  ))),
        ],
      ),
    );
  }
}
