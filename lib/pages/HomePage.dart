import 'package:flutter/material.dart';
import 'package:food_app/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
  List<dynamic> foods = [{
    "image": "assets/images/one.jpg",
    "isFavorite": false,
  }, 
  {
    "image": "assets/images/two.jpg",
    "isFavorite": false,
  },
  {
    "image": "assets/images/three.jpg",
    "isFavorite": false,
  }
  ];

  int selectedCategory = 0;

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
          FadeAnimation(1, IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket, color: Colors.grey[800],),
          ))
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => 
                      FadeAnimation(1, makeCategory(title: categories[index], index: index))
                    ),
                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: <Widget>[
                    //     FadeAnimation(1, makeCategory(title: 'Pizaa')),
                    //     FadeAnimation(1.3, makeCategory(title: 'Burgers')),
                    //     FadeAnimation(1.4, makeCategory(title: 'Kebab')),
                    //     FadeAnimation(1.5, makeCategory(title: 'Desert')),
                    //     FadeAnimation(1.6, makeCategory(title: 'Salad')),
                    //   ],
                    // ),
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
                child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foods.length,
                      itemBuilder: (context, index) => 
                      FadeAnimation(1, makeItem(image: foods[index]["image"], isFavorite: foods[index]["isFavorite"], index:index))
                    ),
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     FadeAnimation(1.4, makeItem(image: 'assets/images/one.jpg')),
                //     FadeAnimation(1.5, makeItem(image: 'assets/images/two.jpg')),
                //     FadeAnimation(1.6, makeItem(image: 'assets/images/three.jpg')),
                //   ],
                // ),
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

  Widget makeCategory({title, index}) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: AnimatedContainer(
          width: 120,
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(title, style: TextStyle(
              color: selectedCategory == index ? Colors.black : Colors.grey[700], 
              fontSize: 16, 
              fontWeight: FontWeight.w600),),
          ),
        ),
    );
  }

  Widget  makeItem({image, isFavorite, index}) {
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        foods[index]["isFavorite"] = !foods[index]["isFavorite"];
                      });
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer( 
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1.5, color: isFavorite ? Colors.red : Colors.transparent,)
                        ),
                      child: isFavorite ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite, color: Colors.white,)),
                    ),
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