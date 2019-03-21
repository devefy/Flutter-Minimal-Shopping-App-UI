import 'package:flutter/material.dart';
import 'ProductCard.dart';
import 'CustomIcon.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Image.asset(
      "assets/store.png",
      width: 35.0,
      height: 35.0,
    ),
    Icon(
      CustomIcons.search,
      size: 32.0,
    ),
    Icon(
      CustomIcons.favorite,
      size: 32.0,
    ),
    Icon(CustomIcons.cart, size: 32.0),
    Image.asset("assets/profile.png", width: 35.0, height: 35.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: new Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 25.0),
                  child:
                      Image.asset("assets/logo.png", width: 62.0, height: 43.0),
                ),
              ),
              ProductCard(0xFFfaecfb, "assets/shoes_01.png",
                  "Hybrid Rocket WNS", "\$999.00", "\$749"),
              SizedBox(
                height: 32.0,
              ),
              ProductCard(0xFFf8e1da, "assets/shoes_02.png",
                  "Hybrid Runner ARS", "\$699", "\$599")
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: Offset(0.0, -3.0),
              blurRadius: 10.0)
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item, index == _currentIndex),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.02),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0)
                ]
              : []),
      child: item,
    );
