import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Homr.dart';
import 'package:login/main.dart';

class splash extends StatefulWidget
{
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      if(FirebaseAuth.instance.currentUser!=null)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) {
          return Home();
        },));
      }
      else
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) {
          return MyHomePage();
        }));
      }});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}