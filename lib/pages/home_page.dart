import 'package:decode_squad/pages/add_patient_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Patient Form'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPatientPage(),
                  ),
                  )
              }, 
              child: Text('Add',style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.blue
              ),
              )
          ]
        ),
      ),
    );
  }
}