import 'package:flutter/material.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int stone1 = 1;
  int stone2 = 1;
  void change() {
    //setstate islie use krnge kyunk uske bina randomly koi ek number ka hi image arha tha, image change nahi horha tha
    //setstate ek random number generate krega and vaisa humara picture display hoga
    //set state ke andar image ko insert kr bhi die toh image bdlegi kaise?
    //image to tab bdlegi jab random numbers generate honge 
    setState(() {
      // +1 means from 1 upto 3 included
      stone1 = Random().nextInt(3)+1;  
      stone2 = Random().nextInt(3)+1; 
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double height = AppBar().preferredSize.height;
    final screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Game',
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                stops: [0.7, 1],
                colors: [Color(0xFF3a1c71), Color(0xFFd76d77)],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: screenHeight,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.7, 1],
              colors: [Color(0xFF3a1c71), Color(0xFFd76d77)],
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
              Container(
                width: screenWidth,
                height: screenHeight * 0.30,
                child: CustomPaint(
                  painter: CurvePainter(),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        onPressed: () {
                          change();
                        },
                        child: Image.asset('images/stone$stone1.png')),
                  ),
                  Expanded(
                    child: FlatButton(
                        onPressed: () {
                          change();
                        },
                        child: Image.asset('images/stone$stone2.png')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    var path = Path();
    path.moveTo(0, size.height * 0.40);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.10,
        size.width * 0.5, size.height * 0.09);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.08,
        size.width * 1.0, size.height * 0.015);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
