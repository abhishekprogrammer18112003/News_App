import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile Page"),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/images/logo.png"),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
