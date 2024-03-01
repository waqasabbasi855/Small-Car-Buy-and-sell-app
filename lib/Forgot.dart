import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/ui.dart';

import 'main.dart';


class forgot extends StatelessWidget
{
  TextEditingController resetmail=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor:Colors.white,appBar: AppBar(backgroundColor: Colors.blue.shade200,title: Text("Forgot",style: TextStyle(color: Colors.white),),),
    body: Padding(
      padding:EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Column(
        children: [
          ui.TxtFields(resetmail,"Reset Password","Enter Verification Email",false),
        SizedBox(height: 10,),
        ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),onPressed: (){

          FirebaseAuth.instance.sendPasswordResetEmail(email: resetmail.text).then((value){
            Navigator.push(context,MaterialPageRoute(builder: (context) {
              return MyHomePage();
            },));

          });
        }, child: Text("Reset Password",style: TextStyle(color: Colors.white),)),
        ],

      ),
    ),
    
    
    );
  }
  
  
}