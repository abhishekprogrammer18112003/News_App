// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/views/homepage.dart';
import 'package:news_app/views/login_screen.dart';
import 'package:news_app/views/nav_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp_Screen extends StatefulWidget {
  @override
  _SignUp_ScreenState createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _mobilecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _showPassword = false;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset("assets/images/logo.png"),
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(171, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _namecontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Name';
                    }

                    // You can add more email validation rules here.
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobilecontroller,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Mobile Number';
                    }
                    if (value.length != 10) {
                      return 'Please enter the correct Mobile Number';
                    }
                    // You can add more email validation rules here.
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email Address';
                    }

                    // You can add more email validation rules here.
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordcontroller,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    // You can add more password validation rules here.
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(
                    child: _isloading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Text('Sign Up'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Perform login here.
                        // You can use _emailController.text and _passwordController.text to get the user's input.
                        setState(() {
                          _isloading = true;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            'name', _namecontroller.text.toString());
                        prefs.setString(
                            "mobileno", _mobilecontroller.text.toString());
                        prefs.setString(
                            "email", _emailcontroller.text.toString());
                        prefs.setString(
                            "password", _passwordcontroller.text.toString());
                      }
                      Timer(Duration(seconds: 3), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Nav_Screen()),
                        );
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    Text("Have an account ? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Screen()));
                        },
                        child: Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
