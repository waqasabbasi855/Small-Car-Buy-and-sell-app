import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ui
{
  static TxtFields(TextEditingController namecontrol,String Fieldname,String Hinttext,bool obsecure)
  {
    return TextField(obscureText: obsecure,controller:namecontrol,decoration: InputDecoration(hintText:"$Hinttext",border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),label: Text("$Fieldname") ));

  }

}
