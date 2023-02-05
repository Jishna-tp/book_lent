import 'package:booklent/forgot_pw.dart';
import 'package:booklent/login.dart';
import 'package:booklent/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0x3375F7FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE610F1FF)),
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE688F8FF)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/pic1.png'))),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Search For \nBibiliophiles',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => next1(),
                  ));
                }),
                backgroundColor: Colors.white,
                hoverColor: Colors.white,
                elevation: 0,
                hoverElevation: 0,
                child: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              widthFactor: 1,
                              heightFactor: 0.5,
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE610F1FF)),
                              ),
                            ),
                            Align(
                              widthFactor: 0.5,
                              heightFactor: 1,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE688F8FF)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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

class next1 extends StatelessWidget {
  const next1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0x4D75F7FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE610F1FF)),
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE688F8FF)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/pic2.png'))),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Exchange Book \nWith Them',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => next2(),
                  ));
                }),
                backgroundColor: Colors.white,
                hoverColor: Colors.white,
                elevation: 0,
                hoverElevation: 0,
                child: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              widthFactor: 1,
                              heightFactor: 0.5,
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE610F1FF)),
                              ),
                            ),
                            Align(
                              widthFactor: 0.5,
                              heightFactor: 1,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE688F8FF)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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

class next2 extends StatelessWidget {
  const next2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0x4D75F7FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE610F1FF)),
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE688F8FF)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/pic3.png'))),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Read The Book \nYou Love',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => next3(),
                  ));
                }),
                backgroundColor: Colors.white,
                hoverColor: Colors.white,
                elevation: 0,
                hoverElevation: 0,
                child: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              widthFactor: 1,
                              heightFactor: 0.5,
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE610F1FF)),
                              ),
                            ),
                            Align(
                              widthFactor: 0.5,
                              heightFactor: 1,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE688F8FF)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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

class next3 extends StatelessWidget {
  const next3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0x4D75F7FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE610F1FF)),
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xE688F8FF)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/pic4.png'))),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Connect With \nPeople And \nReturn The Book',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                }),
                backgroundColor: Colors.white,
                hoverColor: Colors.white,
                elevation: 0,
                hoverElevation: 0,
                child: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              widthFactor: 1,
                              heightFactor: 0.5,
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE610F1FF)),
                              ),
                            ),
                            Align(
                              widthFactor: 0.5,
                              heightFactor: 1,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE688F8FF)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
