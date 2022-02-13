import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPatientPage extends StatefulWidget {
  AddPatientPage({Key? key}) : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final _formKey = GlobalKey<FormState>();
  final genController = TextEditingController();

  var name = "";
  var email = "";
  var referral = "";
  var phonenumber = "";
  var age = "";
  var description = "";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final despController = TextEditingController();
  final phonenumberController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    despController.dispose();
    phonenumberController.dispose();
    ageController.dispose();
    genController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    emailController.clear();
    despController.clear();
    genController.clear();
    phonenumberController.clear();
    ageController.clear();
  }

  CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');

  Future<void> addUser() {
    return patients
        .add({
          'name': name,
          'email': email,
          'referral': referral,
          'phonenumber': phonenumber,
          'description': description,
          'age': age
        })
        .then((value) => print('UserAdded'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Patient"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Email: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Age: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    maxLength: (3),
                    controller: ageController,
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r'^[0-9]*$').hasMatch(value) ||
                          value.isEmpty) {
                        return 'Please Enter Valid Age';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Generate Referral Code",
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: genController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final code = generateCode();
                          setState(() {
                            genController.text = code;
                          });
                        },
                        child: Text("Create New"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Phone Number: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    maxLength: (12),
                    controller: phonenumberController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r'^[0-9]*$').hasMatch(value)) {
                        return 'Please Enter Correct Phone Number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Description: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    maxLength: (120),
                    controller: despController,
                    validator: (value) {
                      if (value == null || value.length < 19 || value.isEmpty) {
                        return 'Please add more Description';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = nameController.text;
                            email = emailController.text;
                            referral = genController.text;
                            age = ageController.text;
                            phonenumber = phonenumberController.text;
                            description = despController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Add Patient',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => {clearText()},
                        child: Text(
                          'Reset',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey))
                  ],
                ))
              ])),
        ));
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
