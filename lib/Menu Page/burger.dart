import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/brain/burgerBrain.dart';
import 'package:restaurant_app/burgers/burgerShell.dart';

class burgers extends StatefulWidget {
  @override
  _burgersState createState() => _burgersState();
}

class _burgersState extends State<burgers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.105),
      child: GridView.builder(itemBuilder: (context,index){
        return burgerCard(no:index+1);
      },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisExtent: MediaQuery.of(context).size.width*0.5,
          crossAxisSpacing: 0.2
        ),
        itemCount: 5,
      ),
    );
  }
}

class burgerCard extends StatefulWidget {
  int no;
  burgerCard({this.no});
  @override
  _burgerCardState createState() => _burgerCardState(no: no);
}

class _burgerCardState extends State<burgerCard> {
  int no;
  _burgerCardState({this.no});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,secondAnimation){
          return detailedBurger(no: no,);
        },
        transitionsBuilder: (context,animation,secondAnimation,child){
          return FadeTransition(opacity: animation,
          child: child,);
        },
        transitionDuration: Duration(milliseconds: 800)));
      },
      splashColor: Colors.white,
      child: Container(
        height: 300,
        width: 150,
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: Container(
                  height: 100,
                  child: Image.asset("Assets/b${no}.png",fit: BoxFit.fill,)),
            ),
            Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 6.0,top: 6.0,bottom: 2.0),
                padding: EdgeInsets.only(right: 6.0,top: 6.0,bottom: 2.0),
                child: Text("Burger No. $no",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w700
                  ),),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 6.0,top: 0.0,bottom: 2.0),
                padding: EdgeInsets.only(right: 6.0,top: 0.0,bottom: 2.0),
                child: Text("Onion with Cheese",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0
                ),),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("₹150.0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300
                    ),),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(top: 2),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: InkWell(child: Padding(
                        padding: const EdgeInsets.only(top:4.0),
                        child: Icon(Icons.add,size: 15,color: Colors.white,),
                      ), onTap: (){
                        setState(() {
                          burgerorder[no].noOfBurgers++;
                        });
                      }),
                    ),
                  ),
                  (burgerorder[no].noOfBurgers!=0)?
                      Text("${burgerorder[no].noOfBurgers}",
                      style: TextStyle(
                        color: Colors.white
                      ),):Text("") ,
                    (burgerorder[no].noOfBurgers!=0)?
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(top: 2),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: InkWell(child: Padding(
                          padding: const EdgeInsets.only(top:4.0),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:15.0),
                            child: Icon(Icons.remove,size: 15,color: Colors.white,),
                          ),
                        ), onTap: (){
                          setState(() {
                            burgerorder[no].noOfBurgers--;
                          });
                        }),
                      ),
                    )
                        :Text("")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


