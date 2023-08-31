import 'package:booklent/admin.dart';
import 'package:booklent/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'home.dart';
import 'dart:convert';

class post_noti_admin extends StatefulWidget {
  const post_noti_admin({Key? key}) : super(key: key);

  @override
  State<post_noti_admin> createState() => _post_noti_adminState();
}

class _post_noti_adminState extends State<post_noti_admin> {
  late TextEditingController bkname;

  @override
  void initState(){
    bkname=TextEditingController();
    super.initState();
  }
  var res;
  void postdata()async {
    String url = Login.url+ "notification/pst/";
    var resp = await post(url,body:{
      "bkname":bkname.text.toString(),
    });
    this.setState(() {
      res=resp.body.toString();
      print(res);
    });

  }

  @override
  Widget build(BuildContext context) {
    // gendrop();
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
                  builder: (BuildContext) => admindraw()));
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
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.transparent)),
                      labelText: 'Book name',
                      labelStyle: TextStyle(
                          color: Color(0xFF007981),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      hintText: 'Book name',
                      hintStyle: TextStyle(color: Colors.grey[700])),
                  controller: bkname,
                ),
              ),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF88F8FF)),
                onPressed: () {
                  postdata();

                },
                child: Text(
                  'Post',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 50),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         focusedBorder: UnderlineInputBorder(
              //             borderRadius: BorderRadius.circular(30),
              //             borderSide:
              //             BorderSide(color: Colors.transparent)),
              //         labelText: res,
              //         labelStyle: TextStyle(
              //             color: Color(0xFF007981),
              //             fontWeight: FontWeight.bold,
              //             fontSize: 15),
              //         hintText: res,
              //         hintStyle: TextStyle(color: Colors.grey[700])),
              //     // controller: age,
              //   ),
              // ),
              // Container(
              //   child: Text(res),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
