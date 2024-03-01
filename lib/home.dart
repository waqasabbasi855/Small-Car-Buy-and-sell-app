import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Forgot.dart';

class home extends StatefulWidget{
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var pref=SharedPreferences.getInstance();
 User? user=FirebaseAuth.instance.currentUser;
  @override
  Widget profiledisplay(String item,String itemvalue)
  { double elv1=0;
    return StreamBuilder(stream:FirebaseFirestore.instance.collection("newuser").
  where("Email",isEqualTo: "${user!.email.toString()}").snapshots(), builder: (context, snapshot) {

    if(snapshot.hasData)
      {
        return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, index) {
          return Card(shadowColor: Colors.green,color: Colors.white,elevation: elv1,
          child: Column(children:[
          Row(children:[SizedBox(width: 10,),Text(item,style:
          TextStyle(fontWeight: FontWeight.normal,fontSize: 18),)]),
          SizedBox(height: 5,),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(color: Colors.black,height: 1),
          ),
                Row(children:[SizedBox(width: 10,),Text(snapshot.data!.docs[index][itemvalue],
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),)]),

                ]));
        },);
      }
    return Container();
  });
  }
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(backgroundColor: Colors.white,appBar: AppBar(centerTitle: true,title: Text("User Information",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue.shade200),
  body:Container(
    child:Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 120),
        child: Container(child: Column(children: [
          SizedBox(height: 10,),
          Container(width: 200,height:200,decoration:BoxDecoration(borderRadius: BorderRadius.circular(110),border: Border.all(color: Colors.black)),child: Column(children: [Icon(Icons.person,size: 150,color: Colors.blue,),
          Container(child: Text("User Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),)),
          ])),
          SizedBox(height: 20,),
          Container(height:65,width:850,child: profiledisplay("Country","Country")),
          Container(height:65,width:850,child: profiledisplay("Name:","Country")),
          Container(height:65,width:850,child: profiledisplay("Email:","Email")),
          Container(height:65,width:850,child: profiledisplay("D-O-B:","D-O-B")),
          SizedBox(height: 10,),
          Container(child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)
    {
      return forgot();
    }));
    }, child: Text("Change Password",style: TextStyle(color: Colors.white),)),),
        ],),),
      )
      ]
    ),));}}