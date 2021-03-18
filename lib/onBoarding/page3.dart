import 'dart:ui';

import 'package:flutter/material.dart';

class page3 extends StatelessWidget {
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
              margin: EdgeInsets.only(bottom: 20,left: 0),
              child: Image.asset("Assets/onb3.png",scale: height*0.0012,alignment: Alignment.topLeft,),
            ),
            Container(
              margin: EdgeInsets.only(top: 30,bottom: 15,),
              child: Text("Want to eat at our place?",
                style: TextStyle(color: Colors.white,
                    fontSize: 30,
                    fontFamily: "JosefinSans",
                    fontWeight: FontWeight.w600),),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text("We have around 50 different restaurants around the country so do come to chill out",
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