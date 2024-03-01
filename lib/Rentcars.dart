import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';

class rentcars extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return rental();
  }
}
class rental extends State<rentcars>
{ List arr=[1,1,1,1,1,1,1,1,1,1];
  @override
  Discountedbox(String Carname,quantity,Color c,String carpic)
  {

    arr[quantity];
    return ClipRRect(borderRadius: BorderRadiusDirectional.circular(0),child:Container(decoration:BoxDecoration(borderRadius:BorderRadius.circular(21),color: Colors.white,border: Border.all(color: Colors.black)),height: 150,width: 500,child: Column(
        children: [
          Container(margin:EdgeInsets.only(),child:
          Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
            Row(children:[
              Container(decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(21),bottomLeft: Radius.circular(21))),height: 148,width: 313,child: Column(
                children: [
                  Container(alignment: Alignment.topLeft,child:Text(Carname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100),),margin: EdgeInsets.only(left: 14,top: 14),),
                  Container(alignment:Alignment.topLeft,height: 100,width: 300,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/images/${carpic}.png"))),),

                ],
              ),),Container(color: Colors.black,height: 148,width:5,),Container(decoration:BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(21),bottomRight: Radius.circular(21)),color: Colors.green.shade100),height: 148,width: 180,child: Column(children: [Container(child: Text("QTY",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),),margin: EdgeInsets.only(top: 10),),
                SizedBox(height:10),Container(width: 50,height:50,child:Card(child:Center(child: Text("${arr[quantity]}")) ,)),
                SizedBox(height: 10,),
                Row(children: [SizedBox(width: 5,),InkWell(onTap: (){
                  if(arr[quantity]>0)
                  {
                    arr[quantity]=arr[quantity]-1;
                    setState(() {
                    });
                  }
                },onHover:(value) {

                  if(c==Colors.black){
                    c=Colors.amber;
                    setState(() {

                    });
                  }
                  else c=Colors.black;
                  setState(() {
                  });
                },child: Container(decoration:BoxDecoration(color:c,borderRadius: BorderRadius.circular(21)),width: 40,height: 40,child: Center(child: Text("-",style: TextStyle(color:Colors.white,fontSize: 30),)),)),
                  SizedBox(width: 5,),
                  Container(width:80,height:40,child:ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return cart(Carname,arr[quantity],"assets/images/${carpic}.png");
                    },));
                  }, child: Row(children:[Text("Cart",textAlign: TextAlign.left,),Icon(Icons.add_shopping_cart_outlined,size: 01,)]),style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.orange.shade300),backgroundColor:MaterialStatePropertyAll(Colors.white),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))))))),
                  SizedBox(width: 5,),
                  InkWell(onTap: (){},child: InkWell(onTap: (){
                    arr[quantity]=arr[quantity]+1;

                    setState(() {

                    });
                  },onHover: (value) {
                    if(c==Colors.black){
                      c=Colors.amber;
                      setState(() {

                      });
                    }
                    else c=Colors.black;
                    setState(() {
                    });
                  },child: Container(decoration:BoxDecoration(borderRadius:BorderRadius.circular(21),color:c),width: 40,height: 40,child: Center(child: Text("+",style: TextStyle(color: Colors.white,fontSize: 20))),)))],)
              ],),)])]),),
        ]),));
    print("$quantity");
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(backgroundColor:Colors.blue.shade200,title: Text("Rent Cars",style: TextStyle(color: Colors.white),),),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Hero(tag: "RentCars",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(padding: EdgeInsets.all(6),
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.red.shade300,borderRadius: BorderRadius.circular(12),image: DecorationImage(image:AssetImage("assets/images/rentcars.jpg"),fit:BoxFit.fill )),height: 200,width: 800,
                  ),
                ),
              ),
            ),
          SizedBox(height: 10,),
          Discountedbox("Range Rover", 2,Colors.black,"rangerover"),
          SizedBox(height: 10,),
          Discountedbox("Civic", 3,Colors.black,"corolla"),
          SizedBox(height: 10,),
          Discountedbox("Cultus", 4,Colors.black,"corolla"),
          SizedBox(height: 10,),
          Discountedbox("Cultus", 4,Colors.black,"corolla"),
          SizedBox(height: 10,),
          Discountedbox("Cultus", 4,Colors.black,"corolla"),
          SizedBox(height: 10,),
          Discountedbox("Cultus", 4,Colors.black,"corolla"),
        ],
      ),
    ),
    );
  }
}