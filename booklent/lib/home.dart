import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<User>> viewUser() async {
      var response = await http
          .get(Uri.parse('http://192.168.43.200:8080/bk_api/readuser.php'));
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => User.fromJson(e)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
        leading: Icon(
          Icons.menu,
          size: 35,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
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
            Expanded(
              child: FutureBuilder(
                future: viewUser(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<User>;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200,
                            width: 200,
                            child: Card(
                              color: Colors.cyan[50],
                              shadowColor: Color(0xE688F8FF),
                              elevation: 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.person),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          items[index].username.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                                  Text(
                                    'Genre',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.swap_horiz_rounded,
                                        color: Colors.green[800],
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.green[800],
                                        size: 30,
                                      )
                                    ],
                                  )
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
                                  Text(
                                    'Genre',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.swap_horiz_rounded,
                                        color: Colors.green[800],
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.green[800],
                                        size: 30,
                                      )
                                    ],
                                  )
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
                                  Text(
                                    'Genre',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.swap_horiz_rounded,
                                        color: Colors.green[800],
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.green[800],
                                        size: 30,
                                      )
                                    ],
                                  )
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
                                  Text(
                                    'Genre',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.swap_horiz_rounded,
                                        color: Colors.green[800],
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.green[800],
                                        size: 30,
                                      )
                                    ],
                                  )
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.black),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.black),
            label: 'Chat',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}

class User {
  String? name;
  String? username;
  String? phone;
  String? email;

  User({this.name, this.username, this.phone, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        username: json['username'],
        phone: json['phone_no'],
        email: json['email_id']);
  }
}
