import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting Screen"),
        ),
        body: Center(
          child: Text(
            "Setting Screen",
          ),
        ));
  }
}
