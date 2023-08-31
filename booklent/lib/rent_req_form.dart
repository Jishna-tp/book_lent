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

class rent_req extends StatefulWidget {
  rent_req({Key? key}) : super(key: key);

  @override
  State<rent_req> createState() => _rent_reqState();
  // static var regid="";
}

class _rent_reqState extends State<rent_req> {
  late TextEditingController bookname,
      date,
      returndate,
      amount,
      borrower,
      owner;
  String? location;
  bool isVisible = true;

  @override
  void initState() {
    bookname = TextEditingController();
    date = TextEditingController();
    returndate = TextEditingController();
    amount = TextEditingController();
    borrower = TextEditingController();
    owner = TextEditingController();
    // password=TextEditingController();

    // town=TextEditingController();
    // city=TextEditingController();
    // pincode=TextEditingController();
    super.initState();
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
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
        returndate.text = "${selectedDate1.toLocal()}".split(' ')[0];
      });
  }

  void postdata() async {
    String url = Login.url + "rent/rent/";
    var resp = await post(url, body: {
      "bookname": bookname.text.toString(),
      "date": date.text.toString(),
      "trndate": returndate.text.toString(),
      "amount": amount.text.toString(),
      "borrower": borrower.text.toString(),
      "owns": owner.text.toString(),
      "uid": Login.uid
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
            'Request for Rent',
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
                          height: 20,
                        ),
                        Text(
                          'RENT FORM',
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
                          child: TextFormField(
                            controller: date,
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Date',
                              hintText: 'date ',
                              prefixIcon: Icon(Icons.date_range),
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(30)
                              // )
                            ),
                            onTap: () {
                              setState(() {
                                _selectDate(context);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            controller: returndate,
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Return date',
                              hintText: 'Return date',
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
                                labelText: 'Amount',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'amount',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: amount,
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
                                labelText: 'borrower',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'borrower',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: borrower,
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
                                labelText: 'Owner',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Owner',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: owner,
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
