import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(-1,-1),
              focalRadius: 0.0000,
              radius: 0.5,
              colors: [
                Color(0xFFBA8B02),
                Color(0xFF181818)
              ]
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 60,left: 60),
            child: Image.asset("Assets/onb2.png",scale: height*0.0012,alignment: Alignment.topLeft,),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,bottom: 15,),
            child: Text("Get good food delivered to you at not extra cost",
              style: TextStyle(color: Colors.white,
                  fontSize: 30,
                  fontFamily: "JosefinSans",
                  fontWeight: FontWeight.w600),),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text("We have many of our delivery executives ready 24/7 for your order and what's more is that there is not extra fee for delivery charge!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic
              ),textAlign: TextAlign.center,),
          )
        ],
      )
    );
  }
}