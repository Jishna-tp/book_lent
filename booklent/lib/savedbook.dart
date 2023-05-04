import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class saved extends StatefulWidget {
  const saved({super.key});

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
  void onSearch(String enteredkeyword) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Color.fromARGB(240, 0, 120, 129),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserHome(),
              ));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            )),
        toolbarHeight: 70,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            'My Wishlist',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xE688F8FF),
        elevation: 5.0,
      ),
      backgroundColor: Colors.cyan[50],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              child: TextField(
                onChanged: (value) => onSearch(value),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search,
                      color: Color(0xFF007981),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide())),
              ),
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
