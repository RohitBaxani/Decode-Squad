import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPatientPage extends StatefulWidget {
  AddPatientPage({Key? key}) : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var email ="";
  var password ="";
  var phonenumber ="";
  var age="";

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final phonenumberController=TextEditingController();
  final ageController=TextEditingController();

@override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phonenumberController.dispose();
    ageController.dispose();
    super.dispose();
  }

  clearText(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phonenumberController.clear();
    ageController.clear();
  }

CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');

Future<void> addUser(){
  return patients
  .add({'name':name,'email':email,'password':password,'phonenumber':phonenumber,'age':age})
  .then((value) => print('UserAdded'))
  .catchError((error)=>print('Failed to add user: $error'));
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
          padding: EdgeInsets.symmetric(vertical:20,horizontal:30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent,fontSize: 15),
                  ),
                  controller: nameController,
                  validator: (value){
                    if(value ==null || value.isEmpty){
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
                      border:OutlineInputBorder(),
                      errorStyle: 
                      TextStyle(color: Colors.redAccent,fontSize:15),
                    ),
                    controller: emailController,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please Enter Email";
                      }
                      else if(!value.contains('@')){
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15), 
                    ),
                    controller: passwordController,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                margin: EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Phone Number: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent,fontSize: 15),
                  ),
                  maxLength: (12),
                  controller: phonenumberController,
                  validator: (value){
                    if(value==null ||value!.isEmpty || !RegExp(r'^[0-9]*$').hasMatch(value!)){
                      return 'Please Enter Correct Phone Number';
                    }
                    return null;
                  },

                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Age: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent,fontSize: 15),
                  ),
                  maxLength: (3),
                  controller: ageController,
                  validator: (value){
                    if(value ==null || !RegExp(r'^[0-9]*$').hasMatch(value!) || value!.isEmpty){
                      return 'Please Enter Valid Age';
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
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          name=nameController.text;
                          email=emailController.text;
                          password=passwordController.text;
                          age=ageController.text;
                          phonenumber=phonenumberController.text;
                          addUser();
                          clearText();
                        });
                      }
                    },
                    child: Text(
                      'Register',
                      style:TextStyle(fontSize:18.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {clearText()},
                     child: Text(
                       'Reset',
                       style: TextStyle(fontSize:18.0),
                     ),
                     style: ElevatedButton.styleFrom(primary:Colors.blueGrey) 
                     )
                ],)
            )
            ]
          )
           ) ,)
    );
  }
}