import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app/brain/burgerBrain.dart';

class detailedBurger extends StatefulWidget {
  var no;
  detailedBurger({this.no});
  @override
  _detailedBurgerState createState() => _detailedBurgerState(no: no);
}

class _detailedBurgerState extends State<detailedBurger> {
  var no;
  _detailedBurgerState({this.no});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.chevronLeft,
          color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment(1,-1),
                focalRadius: 10000,
                radius: 1.6,
                colors: [
                  Color(0xFFBA8B02),
                  Color(0xFF181818)
                ]
            )
          ),
        ),
      ),
      backgroundColor: Color(0xFF181818),
      body: ListView(
        // Image.asset()
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(

            ),
            child: Image.asset(burgerorder[no].burgerImage,fit: BoxFit.fill,),
          ),
          nameOrder(),
          offer(),
          orderBar()
        ],
      ),
    );
  }

  Widget nameOrder(){
    return Container(
      height: 130,
      child: Row(
        children: [
          Container(
            height: 95,
            width: MediaQuery.of(context).size.width*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 3,top: 3,left: 10,right: 5),
                  child: Text("${burgerorder[no].burgerName}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 3,top: 3,left: 10,right: 5),
                  child: Text("${burgerorder[no].burgerDescription}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300
                    ),),
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Icon(Icons.add,
                  size: 27,
                  color: Colors.grey,),
              ),
            ),
            onTap: (){
              setState(() {
                burgerorder[no].noOfBurgers++;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            child: Text("${burgerorder[no].noOfBurgers}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300
              ),),
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(Icons.remove,
                    color: Colors.grey,),
                )
            ),
            onTap: (){
              setState(() {
                if(burgerorder[no].noOfBurgers>=1){
                  burgerorder[no].noOfBurgers--;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget offer(){
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: Text("${burgerorder[no].burgerOffer}",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),),
    );
  }

  Widget orderBar(){
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(left: 11),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Total Price:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  ),textAlign: TextAlign.center,),
                ),
                Text("₹ ${burgerorder[no].noOfBurgers*150}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),textAlign: TextAlign.center,)
              ],
            ),
          ),
          Container(
            height: 60,
            width: 200,
            margin: EdgeInsets.only(bottom: 34,top: 0,left: 5,right: 5 ),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFf0c929).withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.zero,bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
              color: Color(0xFFf0c929)
            ),
            child: TextButton(
              onPressed: (){

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Order Now",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),),
                  Container(
                    margin: EdgeInsets.all(4),
                      height:60,width: 24 ,decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),child: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 20,))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
