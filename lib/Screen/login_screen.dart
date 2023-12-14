import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/Screen/HomeScreen.dart';
import 'package:flutter_application_1/Screen/Admin.dart';
import 'package:flutter_application_1/Screen/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_application_1/Screen/Admin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //bool _isObscure3 = true;
  final _formkey = GlobalKey<FormState>();

  bool visible = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Color.fromRGBO(0, 57, 202, 0.98),
            Color.fromARGB(255, 116, 211, 255),
            Colors.white
          ],
        ),
      ),
      key: _formkey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password should be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              /*validator: (value) {
                passwordController.text = value!;
              }*/
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Forgot password?",
              style: TextStyle(color: const Color.fromARGB(255, 15, 1, 71)),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 15, 1, 71)),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: visible,
                child: Container(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 28, 5, 132),
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don`t have an account?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 15, 1, 71),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin()),
                    );
                  },
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 1, 71),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    ));
  }
}

Future<void> saveUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('islogin', true);
}

void route() {
  // ignore: non_constant_identifier_names
  User? user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance
      .collection('Users')
      .doc(user!.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      if (documentSnapshot.get('role') == "Admin") {
        Navigator.pushReplacement(
          context as BuildContext,
          MaterialPageRoute(
            builder: (context) => Admin(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context as BuildContext,
          MaterialPageRoute(
            builder: (context) => Student(),
          ),
        );
      }
    } else {
      print('Document does not exist on the database');
    }
  });
}

void signIn(String email, String password) async {
  var _formkey;
  if (_formkey.currentState!.validate()) {
    try {
      route();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
