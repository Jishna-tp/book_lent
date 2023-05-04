import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class admin extends StatelessWidget {
  admin({super.key});

  @override
  Widget build(BuildContext context) {
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
      // body: Container(
      //     child:
      //         //   // future: viewUser(),
      //         //   // builder: (context, data) {
      //         //   //   if (data.hasError) {
      //         //   //     return Center(child: Text("${data.error}"));
      //         //   //   } else if (data.hasData) {
      //         //   //     var items = data.data as List<User>;
      //         //   //     return ListView.builder(
      //         //   //         itemCount: items == null ? 0 : items.length,
      //         //   //         itemBuilder: (context, index) {
      //         //   //           return Card(
      //         //   //             color: Colors.cyan[50],
      //         //   //             shadowColor: Color(0xE688F8FF),
      //         //   //             elevation: 10,
      //         //   //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //         //   //             child: Container(
      //         //   //               padding: EdgeInsets.all(8),
      //         //   //               child: Row(
      //         //   //                 mainAxisAlignment: MainAxisAlignment.center,
      //         //   //                 crossAxisAlignment: CrossAxisAlignment.center,
      //         //   //                 children: [
      //         Expanded(
      //             child: Container(
      //   padding: EdgeInsets.only(bottom: 8),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(left: 8, right: 8),
      //         child: Text(
      //           'Name',
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 8, right: 8),
      //         // child: Text(items[index].username.toString()),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 8, right: 8),
      //         // child: Text(items[index].phone.toString()),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 8, right: 8),
      //         // child: Text(items[index].email.toString()),
      //       ),
      //     ],
      //   ),
      // ))
      //     ),
    );
  }
}
