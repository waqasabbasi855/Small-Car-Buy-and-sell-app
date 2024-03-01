import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Cart.dart';
import 'package:login/Rentcars.dart';
import 'package:login/Salescars.dart';
import 'package:login/home.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

List arr=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
 Widget carder(String Category,String Categorypic){
   return Card(elevation: 0.0,color: Colors.brown.shade200,
       child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),image: DecorationImage(fit: BoxFit.fill,image:AssetImage("assets/images/$Categorypic"))),
     child: Column(children: [Container(child: Text(Category,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),alignment: Alignment.topLeft,margin: EdgeInsets.only(left: 20,top: 20),)],),));
 }
 Widget Updater(int quantity)
 {
   return Container(child:Column(children: [ElevatedButton(onPressed: (){
     quantity=quantity+1;
     setState(() {
     });

   }, child:Text("+"))],));
 }
Widget Scroller(String tag)
{

  return   Expanded(child:SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[Hero(tag:"RentCars", child:InkWell(onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context) {
  return rentcars();
},));
        },child: Container(height:200,width:200,child:carder("Rent Cars","rentcars.jpg"),))),
          Hero(tag: "SaleCars",child: InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return salescars();
            },));
          },child: Container(height:200,width:200,child:carder("Sales Cars","salescars.jpg")))),
          Container(height:200,width:200,child:carder("Bikes","bikes.jpg")),
        ]),
  ));
}
Widget Discountedbox(String Carname,quantity,Color c,String carpic)
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

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(appBar: AppBar(
      title: Row(children:
      [SizedBox(width: 200,),
        Text("Home",style: TextStyle(color: Colors.white),),
        SizedBox(width: 100,),
        Container(child: CircleAvatar(backgroundColor: Colors.white,child: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return home();
          },));

        },icon: Icon(Icons.person,color: Colors.blue,)),),)]),centerTitle: true,backgroundColor: Colors.blue.shade200,),
    body:SingleChildScrollView(
      child: Column(
        children: [
            Container(height:200,width: 500,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/images/banner.jpg")))),
          SizedBox(height: 10,),
          Container(child:Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),alignment: Alignment.topLeft,margin: EdgeInsets.only(left: 10),),
        Container(margin:EdgeInsets.only(top: 20),color: Colors.red,height: 3,),
          Container(color: Colors.white,height:200,width:500,child: Column(children:[
           Scroller("RentCars"),
        ],)),
          SizedBox(height: 10,),
          Container(child:Text("Discounted Offers",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),alignment: Alignment.topLeft,margin: EdgeInsets.only(left: 10),),
          Container(margin:EdgeInsets.only(top: 20),color: Colors.red,height: 3,),
          SizedBox(height: 20,),
          Discountedbox("Toyota Corolla", 1,Colors.black,"corolla"), //write carname in small letters and save file in png format
          SizedBox(height: 10,),
          Discountedbox("Range Rover", 2,Colors.black,"rangerover"),
          SizedBox(height: 10,),
          Discountedbox("Civic", 3,Colors.black,"corolla"),
          SizedBox(height: 10,),
          Discountedbox("Cultus", 4,Colors.black,"corolla"),
          BottomNavigationBar(selectedFontSize: 15,selectedItemColor: Colors.red,currentIndex: 1,items: [BottomNavigationBarItem(icon:IconButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)
          {
                    return rentcars();
          })  );},icon:Icon(Icons.add_shopping_cart,size: 23,)),label: "Cart"),BottomNavigationBarItem(icon:Icon(Icons.house),label: "Home",backgroundColor: Colors.green),BottomNavigationBarItem(icon:IconButton(onPressed:()
          {Navigator.push(context, MaterialPageRoute(builder:(context) {
            return rentcars();
          },));} ,icon:Icon(Icons.car_rental)),label: "Category"),],),
        ]),
    ));
  }
}
