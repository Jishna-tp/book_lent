import 'dart:convert';

import 'package:booklent/home.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class genre extends StatelessWidget {
  void onSearch(String enteredkeyword) {}
  genre({super.key});

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
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Choose the category that you enjoy reading. This will help us recommend stories you will love.',
                        style: TextStyle(
                            color: Color(0xFF007981),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    child: TextField(
                      onChanged: (value) => onSearch(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide())),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // // Expanded(
              // //   child: FutureBuilder(
              // //     future: viewGenre(),
              // //     builder: (context, data) {
              // //       if (data.hasError) {
              // //         return Center(child: Text("${data.error}"));
              // //       } else if (data.hasData) {
              // //         var items = data.data as List<Genre>;
              // //         return ListView.builder(
              // //             itemCount: items == null ? 0 : items.length,
              // //             itemBuilder: (context, index) {
              // //               return Card(
              // //                 color: Colors.cyan[50],
              // //                 shadowColor: Color(0xE688F8FF),
              // //                 elevation: 10,
              // //                 margin: EdgeInsets.symmetric(
              // //                     horizontal: 10, vertical: 10),
              // //                 child: Container(
              // //                   padding: EdgeInsets.all(8),
              // //                   child: Row(
              // //                     mainAxisAlignment: MainAxisAlignment.center,
              // //                     crossAxisAlignment: CrossAxisAlignment.center,
              // //                     children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 8, right: 8),
                    //   child: Text(
                    //     items[index].genreid.toString(),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'genre',
                        style: TextStyle(
                            color: Color(0xFF007981),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFF88F8FF)),
                          onPressed: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserHome(),
                            ));
                          }),
                          child: Text(
                            'Select',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    )
                  ],
                ),
              )),

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
