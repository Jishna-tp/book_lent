import 'dart:convert';

import 'package:booklent/approved.dart';
import 'package:booklent/login.dart';
import 'package:booklent/mybooks.dart';
import 'package:booklent/postbook.dart';
import 'package:booklent/request.dart';
import 'package:booklent/transaction.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void onSearch(String enteredkeyword) {}

  @override

  late List data;
  void List_user() async {
    var url = Uri.parse("http://192.168.43.200:8000/register/usereg/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {

    });
    print(resp1.body);
  }

  Widget build(BuildContext context) {
    List_user();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) => userdraw()));
            },
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Readers Near You",
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
              height: 150,
              child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data == null ? 0 : data.length,
                    // itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child:
                              InkWell(
                                onTap: (){
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => Post(),
                                  // ));
                                },
                                child: Card(
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data[index]['username'].toString(),
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                      );
                    },
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text(
                "Books You May Like",
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
              child: Container(
                margin: EdgeInsets.all(10),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Card(
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

class userdraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.cyan[50],
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage('images/logo3.png'),
                width: 200,
                height: 200,
              ),
              // decoration: BoxDecoration(
              //   color: Color(0xE688F8FF),
              // ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('Home'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => UserHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_stories_outlined,
              color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('My Books'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => MyBooksPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_horizontal_circle,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('My Transactions'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => MyTransactionPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book_outlined,
              color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('Request'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => RequestPage()));
              },
            ),

            ListTile(
              leading: Icon(Icons.book_outlined,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('Approved'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => ApprovedPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}