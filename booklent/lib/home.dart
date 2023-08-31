import 'dart:convert';

import 'package:booklent/approved.dart';
import 'package:booklent/editpro.dart';
import 'package:booklent/exch_req_form.dart';
import 'package:booklent/exchangereq.dart';
import 'package:booklent/login.dart';
import 'package:booklent/mybooks.dart';
import 'package:booklent/postbook.dart';
import 'package:booklent/predict.dart';
import 'package:booklent/rent_req_form.dart';
import 'package:booklent/request.dart';
import 'package:booklent/transaction.dart';
import 'package:booklent/user.dart';
import 'package:booklent/view_app_exchange_request.dart';
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

  late List data,datas,outputList;
  void List_user() async {
    var url = Uri.parse(Login.url+"register/usereg/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
  }
  // late List outputList;
  var len=0;
  late TextEditingController filt;
  bool isSearching = false,isFavourite = true;
  var ischeck = [] ;
  // late List datas;
  void List_books() async {
    var url = Uri.parse(Login.url+"userpost/srch/");
    Response resp1 = await post(url,body: {
      "uid":Login.uid
    });
    // Response resp1 = await post(url,body: {'uid':Login.uid});

    this.setState(() {
      datas = jsonDecode(resp1.body);
      outputList = datas;
      len = outputList.length;
      print(len);
    });
    // print(resp1.body);

  }
  @override
  void initState() {
    List_books();
    filt = TextEditingController();
  }

  void postdata(bidd)async {
    String url=Login.url+"favoritr/fav/";
    var resp=await post(url,body:{
      "uid":Login.uid,
      "bid":bidd.toString()
    });
  }


  void rent(bidd,rcid)async {
    String url=Login.url+"chat/rntcht/";
    var resp=await post(url,body:{
      "uid":Login.uid,
      "bid":bidd.toString(),
      "rcid":rcid.toString()
    });
  }

  void excng(bidd,rcid)async {
    String url=Login.url+"chat/chtexch/";
    var resp=await post(url,body:{
      "uid":Login.uid,
      "bid":bidd.toString(),
      "rcid":rcid.toString()
    });
  }
  Widget build(BuildContext context) {
    List_user();
    // List_books();
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => editpro()));
              },
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
                controller: filt,
                onChanged: (data1) {
                  if (data1 != "") {
                    setState(() {
                      outputList =
                          datas.where((o) => o['book_name'].contains(data1)).toList();
                      // outputList = data.where((o) => o['name']==data1).toList();
                    });
                  } else {
                    setState(() {
                      outputList = datas;
                    });
                  }
                },

                // onChanged: (value) => onSearch(value),
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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
    itemCount: outputList == null ? 0 : outputList.length,
    // itemCount: 2,
    itemBuilder: (context, index) {
      return Padding(padding: EdgeInsets.all(0),

        child: InkWell(
          onTap: () {

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 150,
                      color: Colors.lightGreen,
                      child: Image.network(Login.url+"static/"+outputList[index]['image'].toString(),
                      fit: BoxFit.cover),
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          outputList[index]['book_name'].toString(),
                          style: TextStyle(

                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                        Text(
                          outputList[index]['author_name'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Text(
                          outputList[index]['gendr'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Text(
                          outputList[index]['status'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        // ElevatedButton(
                        //   style: OutlinedButton.styleFrom(
                        //       backgroundColor: Color(0xFF88F8FF)),
                        //   onPressed: () {
                        //     // print("hello");
                        //     postdata(outputList[index]['book_id'].toString());
                        //     print(outputList[index]['book_id'].toString());
                        //   },
                        //   child: Text(
                        //     'Favorite',
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 15),
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                        Row(
                          children: [
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xFF88F8FF)),
                              onPressed: () {
                                // print("hello");
                                rent(outputList[index]['book_id'].toString(),
                                    outputList[index]['u_id'].toString());
                                // print(outputList[index]['book_id'].toString());
                              },
                              child: Text(
                                'Rent',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xFF88F8FF)),
                              onPressed: () {
                                // print("hello");
                                excng(outputList[index]['book_id'].toString(),
                                    outputList[index]['u_id'].toString());
                                // print(outputList[index]['book_id'].toString());
                              },
                              child: Text(
                                'Exchange',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),

                          ],
                        ),




                      ],
                    ),
                    IconButton(
                      onPressed:() {
                        // print("hello");
                        postdata(outputList[index]['book_id'].toString());
                        print(outputList[index]['book_id'].toString());
                        setState(() {
                          isFavourite = false;
                        });
                      },
                      icon: Icon(Icons.favorite,
                          color: (isFavourite == true)
                              ? Color(0xFF88F8FF)
                              : Colors.red),
                    ),
                  ],
                )),
          ),
        ),
      );
    },
              ),
            ),
        ),
  ]
      ),

    ));
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
              title: Text('Predict'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => predict()));
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_horizontal_circle,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('My Transactions'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => transcation()));
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
              title: Text('Exchange Request'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => exch_request()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book_outlined,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('View Approved Exchange Request'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => vw_app_exch_request()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book_outlined,
                color: Color.fromARGB(240, 0, 120, 129),),
              title: Text('Approved'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => vw_appr_request()));
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