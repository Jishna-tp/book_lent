import 'dart:io';

import 'package:booklent/genre.dart';
import 'package:booklent/home.dart';
import 'package:booklent/location.dart';
import 'package:booklent/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

import 'dart:convert';

class exch_req extends StatefulWidget {
  exch_req({Key? key}) : super(key: key);

  @override
  State<exch_req> createState() => _exch_reqState();
// static var regid="";
}

class _exch_reqState extends State<exch_req> {
  late TextEditingController bookname,
      bookforexchange,
      owner,
      exch_date,
      usr_nm;
  String? location;
  bool isVisible = true;

  @override
  void initState() {
    bookname = TextEditingController();
    bookforexchange = TextEditingController();
    owner = TextEditingController();
    exch_date = TextEditingController();
    usr_nm = TextEditingController();
    // own_id=TextEditingController();
    // password=TextEditingController();

    // town=TextEditingController();
    // city=TextEditingController();
    // pincode=TextEditingController();
    super.initState();
  }

  DateTime selectedDate1 = DateTime.now();
  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(1850, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
        exch_date.text = "${selectedDate1.toLocal()}".split(' ')[0];
      });
  }

  void postdata() async {
    String url = Login.url + "exchange/exch/";
    var resp = await post(url, body: {
      "bookname": bookname.text.toString(),
      "date": exch_date.text.toString(),
      "bkexch": bookforexchange.text.toString(),
      "owner": owner.text.toString(),
      "usr": usr_nm.text.toString(),
      // "owns":own_id.text.toString(),
    });
    // rent_req.regid=resp.body;
    // print(rent_req.regid);
    // print(resp.body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext) => userdraw()));
            },
            icon: Icon(
              Icons.menu,
              size: 40,
            )),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            'Request for exchange',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xE688F8FF),
        iconTheme: IconThemeData(color: Color.fromARGB(240, 0, 120, 129)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0x3375F7FF),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Request for Exchange',
                          style: TextStyle(
                              color: Color(0xFF007981),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                labelText: 'Book Name',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter name',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: bookname,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 50),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //         focusedBorder: UnderlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30),
                        //             borderSide:
                        //                 BorderSide(color: Colors.transparent)),
                        //         labelText: 'User name',
                        //         labelStyle: TextStyle(
                        //             color: Color(0xFF007981),
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 15),
                        //         hintText: 'Enter username',
                        //         hintStyle: TextStyle(color: Colors.grey[700])),
                        //     controller: username,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                labelText: 'Book for Exchange',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter for exchange',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: bookforexchange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            controller: exch_date,
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Exchange date',
                              hintText: 'Exchange date',
                              prefixIcon: Icon(Icons.date_range),
                              // border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(30)
                              // )
                            ),
                            onTap: () {
                              setState(() {
                                _selectDate1(context);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                labelText: 'owner',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'owner',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: owner,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                labelText: 'user name',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'user name',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: usr_nm,
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 50),
                        //   child:
                        //   DropdownButtonFormField(
                        //     value: choosevalue.isNotEmpty ? choosevalue : null,
                        //     onChanged: (newvalue) {
                        //       setState(() {
                        //         choosevalue = newvalue as String;
                        //       });
                        //     },
                        //     items: data
                        //         .map((e) => DropdownMenuItem(
                        //       child: Text(e['genre_name'].toString()),
                        //       value: e['genre_id'].toString(),
                        //     ))
                        //         .toList(),
                        //     icon: Icon(
                        //       Icons.arrow_drop_down,
                        //       color: Color.fromARGB(240, 0, 120, 129),
                        //     ),
                        //     dropdownColor: Colors.cyan[50],
                        //     decoration: InputDecoration(labelText: "Genre"),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFF88F8FF)),
                          onPressed: () {
                            postdata();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => genre(),
                            // ));
                          },
                          child: Text(
                            'Post',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        //       Center(
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Text(
                        //                 "Already Have An Account? ",
                        //                 style: TextStyle(
                        //                   fontSize: 13,
                        //                 ),
                        //               ),
                        //               InkWell(
                        //                 child: Text(
                        //                   'Log in',
                        //                   style: TextStyle(
                        //                       fontSize: 13,
                        //                       decoration: TextDecoration.underline),
                        //                 ),
                        //                 onTap: () {
                        //                   Navigator.of(context).push(MaterialPageRoute(
                        //                     builder: (context) => Login(),
                        //                   ));
                        //                 },
                        //               ),
                        //             ],
                        //           ))
                        //     ],
                        //   ),
                        // ),
                        // Column(
                        //   // mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Container(
                        //           // height: MediaQuery.of(context).size.height,
                        //           width: MediaQuery.of(context).size.width,
                        //           child: Stack(
                        //             alignment: Alignment.bottomRight,
                        //             children: [
                        //               Align(
                        //                 widthFactor: 1,
                        //                 heightFactor: 0.5,
                        //                 alignment: Alignment.topCenter,
                        //                 child: Container(
                        //                   height: 180,
                        //                   width: 180,
                        //                   decoration: BoxDecoration(
                        //                       shape: BoxShape.circle,
                        //                       color: Color(0xE610F1FF)),
                        //                 ),
                        //               ),
                        //               Align(
                        //                 widthFactor: 0.5,
                        //                 heightFactor: 1,
                        //                 alignment: Alignment.centerLeft,
                        //                 child: Container(
                        //                   height: 140,
                        //                   width: 140,
                        //                   decoration: BoxDecoration(
                        //                       shape: BoxShape.circle,
                        //                       color: Color(0xE688F8FF)),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
