import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 50,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            'Booklent',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xE688F8FF),
        elevation: 5.0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 40,
            )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ),
            ),
          )
        ],
        iconTheme: IconThemeData(color: Color.fromARGB(240, 0, 120, 129)),
      ),
      backgroundColor: Colors.cyan[50],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "People Near You",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                  child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                  Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                ],
              )),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              "Books You May Like",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Container(
                          height: 175,
                          // width: 300,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('images/logo3.png'),
                                width: 200,
                                height: 200,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Book Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Auther Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.green[800],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'location',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Icon(
                                  //       Icons.swap_horiz_rounded,
                                  //       color: Colors.green[800],
                                  //       size: 40,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 50,
                                  //     ),
                                  //     Icon(
                                  //       Icons.attach_money_outlined,
                                  //       color: Colors.green[800],
                                  //       size: 30,
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Container(
                          height: 175,
                          // width: 300,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('images/logo3.png'),
                                width: 200,
                                height: 200,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Book Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Auther Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.green[800],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'location',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),

                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Icon(
                                  //       Icons.swap_horiz_rounded,
                                  //       color: Colors.green[800],
                                  //       size: 40,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 50,
                                  //     ),
                                  //     Icon(
                                  //       Icons.attach_money_outlined,
                                  //       color: Colors.green[800],
                                  //       size: 30,
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ],
                          )),
                    ),
                    Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Container(
                          height: 175,
                          // width: 200,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('images/logo3.png'),
                                width: 200,
                                height: 200,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Book Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Auther Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.green[800],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'location',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Icon(
                                  //       Icons.swap_horiz_rounded,
                                  //       color: Colors.green[800],
                                  //       size: 40,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 50,
                                  //     ),
                                  //     Icon(
                                  //       Icons.attach_money_outlined,
                                  //       color: Colors.green[800],
                                  //       size: 30,
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ],
                          )),
                    ),
                    Card(
                      color: Colors.cyan[50],
                      shadowColor: Color(0xE688F8FF),
                      elevation: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Container(
                          height: 175,
                          // width: 200,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage('images/logo3.png'),
                                width: 200,
                                height: 200,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Book Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Auther Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.green[800],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'location',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),

                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Icon(
                                  //       Icons.swap_horiz_rounded,
                                  //       color: Colors.green[800],
                                  //       size: 40,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 50,
                                  //     ),
                                  //     Icon(
                                  //       Icons.attach_money_outlined,
                                  //       color: Colors.green[800],
                                  //       size: 30,
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
