import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Register(TextEditingController email,TextEditingController pass,TextEditingController name,TextEditingController dob,TextEditingController country ,String error) async
{
  try {
    FirebaseFirestore.instance.collection("newuser").add({"Country":"${country.text}","Name":"${name.text}","Email":"${email.text}","D-O-B":"${dob.text}"});
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: pass.text).then((value){
        });
  }
  catch(e)
  {
    print("error");

  }
}

