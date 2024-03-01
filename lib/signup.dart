import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/ui.dart';


import 'Register user.dart';
import 'main.dart';

class signup extends StatefulWidget{
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController namecontrol=TextEditingController();
  TextEditingController passcontrol=TextEditingController();
  TextEditingController emailcontrol=TextEditingController();
  TextEditingController countrycontrol=TextEditingController();
  TextEditingController datecontrol=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor:Colors.white,appBar: AppBar(title: Text("Signup",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue.shade200),
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Container(height:500,width:900,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height:130,width:130,child: CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.person,size: 110,color: Colors.blue,),)),
                    ui.TxtFields(emailcontrol, "Username", "Enter Username",false),
                    SizedBox(height: 10,),
                    ui.TxtFields(passcontrol, "Password", "Enter Password",true),
                    SizedBox(height: 10,),
                    ui.TxtFields(namecontrol, "Name", "Enter Name",false),
                    SizedBox(height: 10,),
                    ui.TxtFields(datecontrol, "D-O-B", "Enter D-O-B",false),
                    SizedBox(height: 10,),
                    ui.TxtFields(countrycontrol, "Country", "Enter Country",false),
                    SizedBox(height: 10,),
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),onPressed: () async{
                      Register(emailcontrol, passcontrol,namecontrol,datecontrol,countrycontrol, "Enter some");
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MyHomePage();
                      },));
                      setState(() {});
                    }, child: Text("Signup",style: TextStyle(color: Colors.white),)),])

          ),
        ));
  }
}