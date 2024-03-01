import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget{
  String carname="";
String carpic="";
  cart(this.carname, this.quantity,this.carpic);

  int quantity=0;

  @override
  State<cart> createState() => _cartState(carname,quantity,carpic);
}

class _cartState extends State<cart> {
  String car;
  int qty;
  String carpic;
  _cartState(this.car, this.qty,this.carpic);
  Widget Cartitems(){
    return Column(children: [
      Wrap(
          children:[
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.black)),child: Column(children: [

              Wrap(
              children: [Row(children: [
                SizedBox(width:200,height: 200,child: ClipRRect(child:Card(color: Colors.green,elevation: 10,child:
                Column(children:
                [Text("$car",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),),Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("$carpic"))),height: 100,width:200,),Row(children: [SizedBox(height: 50,width: 50,child:Card(child: Center(child: Text("$qty")),)),SizedBox(
                  width: 120,height: 40,
                  child: ElevatedButton(onPressed: (){
                  }, child: Row(mainAxisAlignment: MainAxisAlignment.center, children:[Text("Buy Now",textAlign: TextAlign.left,)]),style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.orange.shade300),backgroundColor:MaterialStatePropertyAll(Colors.white),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)))))),
                )],)],)),),),

              ],),],
            )
          ],),),
          ]),
    ],);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar:AppBar(title: Text("Cart",style: TextStyle(color: Colors.white,),),centerTitle: true,backgroundColor: Colors.blue.shade200),
    body:Cartitems(),
    );

  }
}