import 'package:booklent/genre.dart';
import 'package:booklent/login.dart';
import 'package:booklent/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'dart:convert';

class location extends StatefulWidget {
  location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  late TextEditingController town, city,pincode;

  String? location;
  bool isVisible = false;
  bool visible = false;

  @override
  void initState(){
    city=TextEditingController();
    town =TextEditingController();
    pincode=TextEditingController();
    super.initState();
  }

  // void postdata()async {
  //   String url="http://192.168.43.200:8000/location/loc/";
  //   var resp=await post(url,body:{
  //     "town":town.text.toString(),
  //     "city":city.text.toString(),
  //     "pincode":pincode.text.toString(),
  //     "uid":signup.regid,
  //   });
  // }

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
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'images/logo3.png',
                      ),
                    ),
                    Text(
                      'Enter your Location',
                      style: TextStyle(
                          color: Color(0xFF007981),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 65),
                      child: RadioListTile(
                        title: Text(
                          'Current location',
                          style: TextStyle(color: Color(0xFF007981)),
                        ),
                        activeColor: Color(0xE610F1FF),
                        value: 'current',
                        groupValue: location,
                        onChanged: (String? value) {
                          setState(() {
                            location = value;
                            if (location == value) {
                              setState(() {
                                isVisible = false;
                                visible = true;
                              });
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 65),
                      child: RadioListTile(
                        title: Text('Enter manually',
                            style: TextStyle(color: Color(0xFF007981))),
                        activeColor: Color(0xE610F1FF),
                        value: 'manual',
                        groupValue: location,
                        onChanged: (String? value) {
                          setState(() {
                            location = value;
                            if (location == value) {
                              setState(() {
                                isVisible = true;
                                visible = true;
                              });
                            }
                          });
                        },
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50),
                              child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    labelText: 'Town',
                                    labelStyle: TextStyle(
                                        color: Color(0xFF007981),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    hintText: 'Enter your town',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700])),
                                controller: town,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 50),
                              child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    labelText: 'City',
                                    labelStyle: TextStyle(
                                        color: Color(0xFF007981),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    hintText: 'Enter your city',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700])),
                                controller: city,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 50),
                              child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    labelText: 'Pincode',
                                    labelStyle: TextStyle(
                                        color: Color(0xFF007981),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    hintText: 'Enter pincode',
                                    hintStyle:
                                    TextStyle(color: Colors.grey[700])),
                                controller: pincode,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF88F8FF)),
                        onPressed: () {
                          // postdata();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => genre(),
                          ));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
