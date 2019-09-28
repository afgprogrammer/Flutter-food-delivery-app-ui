import 'package:flutter/material.dart';
import 'package:food_app/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket, color: Colors.grey[800],),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text('Food Delivery', style: TextStyle(color: Colors.grey[80], fontWeight: FontWeight.bold, fontSize: 30),)),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FadeAnimation(1, makeCategory(isActive: true, title: 'Pizaa')),
                        FadeAnimation(1.3, makeCategory(isActive: false, title: 'Burgers')),
                        FadeAnimation(1.4, makeCategory(isActive: false, title: 'Kebab')),
                        FadeAnimation(1.5, makeCategory(isActive: false, title: 'Desert')),
                        FadeAnimation(1.6, makeCategory(isActive: false, title: 'Salad')),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            FadeAnimation(1, Padding(
              padding: EdgeInsets.all(20),
              child: Text('Free Delivery', style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.bold),),
            )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(1.4, makeItem(image: 'assets/images/one.jpg')),
                    FadeAnimation(1.5, makeItem(image: 'assets/images/two.jpg')),
                    FadeAnimation(1.6, makeItem(image: 'assets/images/three.jpg')),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.grey[500], fontSize: 18, fontWeight: isActive ? FontWeight.bold : FontWeight.w100),),
        ),
      ),
    );
  }

  Widget  makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite, color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("\$ 15.00", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Vegetarian Pizza", style: TextStyle(color: Colors.white, fontSize: 20),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}