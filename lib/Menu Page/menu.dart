import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app/Menu%20Page/burger.dart';
import 'package:restaurant_app/brain/burgerBrain.dart';

class menuPage extends StatefulWidget {
  @override
  _menuPageState createState() => _menuPageState();
}

class _menuPageState extends State<menuPage>  with TickerProviderStateMixin{
  final int numberPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List<burgerProduct> order;

  List<Widget> _buildPageIndicator(){
    List<Widget> list = [];
    List<String> appbar = ["Burger","Pasta","Salads"];
    for(int i=0;i< numberPages;i++){
      list.add(i==currentPage? _indicator(true,appbar[i]):_indicator(false,appbar[i]));
    }
    return list;
  }

  Widget _indicator(bool isActive,String name){
    return AnimatedContainer(duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0,
      vertical: 20),
      height: 25.0,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.285,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0)
      ),
      child: Row(
        children: [
          (isActive)?Container(
            margin: EdgeInsets.all(6),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amberAccent,
            ),

          ):Text(""),
          Text(name,
          style: TextStyle(
            color: isActive?Colors.white:Colors.white38,
            fontSize: 20
          ),),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(bottom:30.0),
          child: IconButton(
            icon: FaIcon(FontAwesomeIcons.hamburger),
            alignment: Alignment.center,
            onPressed: (){

            },
            mouseCursor: MouseCursor.defer,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.40,
                style: BorderStyle.solid
              ),
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.search,
              color: Colors.white,),
              onPressed: (){
              },
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(-1,-1),
                  focalRadius: 0.0000,
                  radius: 1.2,
                  colors: [
                    Color(0xFFBA8B02),
                    Color(0xFF181818)
                  ]
              )
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: Color(0xFF181818),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:25.0,bottom: 5,left: 25,right: 25),
              child: Text("Every Bite a",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 29,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0,left: 25,top: 5,right: 25),
              child: Text("Better Burger",
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.w300
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              margin: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
              padding: EdgeInsets.all(15),
              child: PageView(
                children: [
                  Container(
                    child: burgers(),
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.blue,
                  )
                ],
                onPageChanged: (page){
                  setState(() {
                    currentPage = page;
                  });
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
              ),
            )

          ],
        )
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Color(0xFF181818)
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF181818),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.mail_outline,color: Colors.white,),label: ""),
            BottomNavigationBarItem(icon: Stack(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFBA8B02),
                    shape: BoxShape.circle
                  ),
                ),
                Icon(Icons.shopping_bag_outlined,color: Colors.white)
              ],
            ),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline,color: Colors.white,),label: "")
          ],
        ),
      ),
    );
  }
}
