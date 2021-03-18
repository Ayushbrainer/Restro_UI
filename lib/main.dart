import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/Menu%20Page/menu.dart';
import 'package:restaurant_app/animation/animation.dart';
import 'package:restaurant_app/onBoarding/page1.dart';
import 'package:restaurant_app/onBoarding/page3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'onBoarding/page2.dart';

void main ()=> runApp(
  MaterialApp(
    home: onBoarding(),
  )
);


class onBoarding extends StatefulWidget {
  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> with SingleTickerProviderStateMixin{
  int _currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 1200),vsync: this);

    final curvedAnimation = CurvedAnimation(
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOutCubic,
        parent: animationController
    );

    animation = Tween<double>(begin:0 ,end: 1)
        .animate(curvedAnimation);
    animationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          controller: pageController,
          children: [
            animated_Image(child: page1(),angle: animation,),
            animated_Image(child: page2(),angle: animation,),
            animated_Image(child: page3(),angle: animation,),
          ],
          onPageChanged: (page){
            setState(() {
              _currentPage = page;
            });
          },
        ),
      ),
      floatingActionButton: (_currentPage==2)?FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,secondAnimation){
          return menuPage();
        },
        transitionsBuilder: (context,animation,secondAnimation,child){
          return FadeTransition(opacity: animation,
          child: child,);
        },
            reverseTransitionDuration: Duration(milliseconds: 750),
          transitionDuration: Duration(milliseconds: 400)
        ));
      }, label: Row(children: [Text("Hungry ?  "),FaIcon(FontAwesomeIcons.hamburger)]),
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.redAccent,):Text(""),
    );
  }
}
