import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Cart.dart';
import 'package:login/Homr.dart';
import 'package:login/ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Forgot.dart';
import 'signup.dart';
import 'splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyBJiAcMi2V7UYqL80zD9lrQkXW4QlQzD_A", appId:"1:414433486013:android:8ec2c055c02546fbdd83d4", messagingSenderId: "414433486013", projectId:"fire-6a9a2" ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Register(TextEditingController name,TextEditingController pass,String error) async
  {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: name.text, password: pass.text).then((value){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Home();
        },));
      });
    }
    catch(e)
    {
      return e;

    }
  }
  Loggedin(TextEditingController name,TextEditingController pass,String error) async
  {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: name.text, password: pass.text).then((value){
        FirebaseFirestore.instance.collection("user").add({"username":namecontrol.text});
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return Home();
        },));
      });
    }
    catch(e)
    {
      return Text("${Exception("good")}");

    }
  }
  String? name;
  String? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getter();
  }
  getter  ()async
  {
    var getpref=await SharedPreferences.getInstance();
    user=getpref.getString("name");
    setState(() {
    });
  }

  TextEditingController namecontrol=TextEditingController();
  TextEditingController passcontrol=TextEditingController();
  var curent=FirebaseAuth.instance.currentUser?.email.toString();
  String us="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,appBar:AppBar(backgroundColor: Colors.blue.shade200,title: Text("Login",style: TextStyle(color: Colors.white),)),
        body:Center(

          child: Container(height:500,width:300,color: Colors.white,
            child: Column(
              children: [
                Container(height:130,width:130,child: CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.person,size: 110,color: Colors.blue,),)),
                SizedBox(height: 10,),
                ui.TxtFields(namecontrol, "Username", "Enter Username",false),
                SizedBox(height: 10,),
                ui.TxtFields(passcontrol, "Password", "Enter Password",true),
                SizedBox(height: 10,),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),onPressed: () async{
                  name=namecontrol.text;
                  var pref=await SharedPreferences.getInstance();
                  pref.setString("name",namecontrol.text);
                  Loggedin(namecontrol, passcontrol, "Enter some");
                  setState(() {});
                }, child: Text("Login",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                Container(child:Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder:(context) {
                        return signup();
                      },));
                    },child: Text("Signup")),
                    SizedBox(width: 2,),
                    Container(child: Text("/"),),
                    SizedBox(width: 2,),
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return forgot();
                      },));
                    },child: Text("Forgot password"))]),
                )
                ),
              ],
            ),
          ),
        )
    );
  }
}
