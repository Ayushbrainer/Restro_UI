import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
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
           child: Image.asset("Assets/onb1.png",scale: height*0.0012,alignment: Alignment.topLeft,),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,bottom: 15,),
            child: Text("Tasty Burgers",
            style: TextStyle(color: Colors.white,
            fontSize: 30,
            fontFamily: "JosefinSans",
            fontWeight: FontWeight.w600),),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text("Choose from our wide variety of burgers that can satisfy from the childish to the most mature taste buds",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic
            ),textAlign: TextAlign.center,),
          )
        ],
      )
    );
  }
}
