import 'dart:io';

import 'package:booklent/genre.dart';
import 'package:booklent/location.dart';
import 'package:booklent/login.dart';
import 'package:booklent/nwloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

import 'dart:convert';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
  static var regid="";
}

class _signupState extends State<signup> {
  late TextEditingController username,gender,dob,interest,phone,email,password,age;
  String? location;
  bool isVisible = true;
  bool validateEmail(String value) {
    var email = value;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    print(emailValid);
    return emailValid;
  }
  bool validatephone(String value){
    var ph=value;
    bool phone=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(ph);
    return phone;

  }

  @override

  void initState(){

    username =TextEditingController();
    gender=TextEditingController();
    dob=TextEditingController();
    age=TextEditingController();
    interest=TextEditingController();
    phone=TextEditingController();
    email=TextEditingController();
    password=TextEditingController();

    // town=TextEditingController();
    // city=TextEditingController();
    // pincode=TextEditingController();

    super.initState();
    mapviewnear();
  }

  void postdata()async {
    String url=Login.url+"register/usereg/";
    if(username.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Name")));
      }
    else if(gender.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required gender")));
      }
    else if(dob.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Dob")));
      }
    else if(interest.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Interest")));
      }
    else if(!validatephone(phone.text))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Phone")));
      }
    else if(!validateEmail(email.text))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required email")));
      }
    else if(password=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Password")));
      }
    else{
      var resp=await post(url,body:{
        "username":username.text.toString(),
        "gender":gender.text.toString(),
        "age":age.text.toString(),
        "interest":interest.text.toString(),
        "phone_no":phone.text.toString(),
        "email":email.text.toString(),
        "password":password.text.toString(),
      });
      signup.regid=resp.body;
      // print(signup.regid);
      // print(resp.body);
    }
  }
  String choosevalue="";
  late List data;
  void List_function() async {
    var url = Uri.parse(Login.url+"genre/genview/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    setState(() {

    });
    print(resp1.body);
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
        dob.text = "${selectedDate.toLocal()}".split(' ')[0];
        age.text = calculateAge(selectedDate);
      });
  }
  // void postloc()async {
  //   String url="http://192.168.43.200:8000/location/loc/";
  //   var resp=await post(url,body:{
  //     "town":town.text.toString(),
  //     "city":city.text.toString(),
  //     "pincode":pincode.text.toString(),
  //     "uid":signup.regid,
  //   });
  // }
  // String age = '';
  String calculateAge(DateTime selectedDate) {
    // String date = dob.text;
    final currentDate = DateTime.now();
    // DateTime birthDate = DateTime.parse();


    int years = currentDate.year - selectedDate.year;
    int months = currentDate.month - selectedDate.month;
    int days = currentDate.day - selectedDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
    }
    print(years);
    return years.toString();

  }


  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
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
                                  height: 180,
                                  width: 180,
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
                                  height: 140,
                                  width: 140,
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
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                              'Sign Up',
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
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter name',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: username,
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
                                labelText: 'Gender',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Male/Female',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: gender,
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
                        //         labelText: 'Age',
                        //         labelStyle: TextStyle(
                        //             color: Color(0xFF007981),
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 15),
                        //         hintText: 'Enter age',
                        //         hintStyle: TextStyle(color: Colors.grey[700])),
                        //     controller: age,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            controller: dob,
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Date of Birth',
                              hintText: 'date ',
                              prefixIcon: Icon(Icons.date_range),
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(30)
                              // )
                            ),
                            onTap: (){
                              setState(() {
                                _selectDate(context);
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
                                labelText: 'Interest',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter your interest',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: interest,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter phone number',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: phone,
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
                                labelText: 'Email Id',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter email id',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: email,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Color(0xFF007981),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintText: 'Enter password',
                                hintStyle: TextStyle(color: Colors.grey[700])),
                            controller: password,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 50),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //         focusedBorder: UnderlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30),
                        //             borderSide:
                        //                 BorderSide(color: Colors.transparent)),
                        //         labelText: 'Confirm Password',
                        //         labelStyle: TextStyle(
                        //             color: Color(0xFF007981),
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 15),
                        //         hintText: 'Enter password again',
                        //         hintStyle: TextStyle(color: Colors.grey[700])),
                        //     controller: confirmpassword,
                        //   ),
                        // ),
                        // Visibility(
                        //   visible: isVisible,
                        //   // maintainSize: true,
                        //   // maintainAnimation: true,
                        //   // maintainState: true,
                        //   child: Container(
                        //     child: Column(
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 50),
                        //           child: TextField(
                        //             decoration: InputDecoration(
                        //                 focusedBorder: UnderlineInputBorder(
                        //                     borderRadius: BorderRadius.circular(30),
                        //                     borderSide: BorderSide(
                        //                         color: Colors.transparent)),
                        //                 labelText: 'Town',
                        //                 labelStyle: TextStyle(
                        //                     color: Color(0xFF007981),
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 15),
                        //                 hintText: 'Enter your town',
                        //                 hintStyle:
                        //                 TextStyle(color: Colors.grey[700])),
                        //             controller: town,
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 50),
                        //           child: TextField(
                        //             decoration: InputDecoration(
                        //                 focusedBorder: UnderlineInputBorder(
                        //                     borderRadius: BorderRadius.circular(30),
                        //                     borderSide: BorderSide(
                        //                         color: Colors.transparent)),
                        //                 labelText: 'City',
                        //                 labelStyle: TextStyle(
                        //                     color: Color(0xFF007981),
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 15),
                        //                 hintText: 'Enter your city',
                        //                 hintStyle:
                        //                 TextStyle(color: Colors.grey[700])),
                        //             controller: city,
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               vertical: 5, horizontal: 50),
                        //           child: TextField(
                        //             decoration: InputDecoration(
                        //                 focusedBorder: UnderlineInputBorder(
                        //                     borderRadius: BorderRadius.circular(30),
                        //                     borderSide: BorderSide(
                        //                         color: Colors.transparent)),
                        //                 labelText: 'Pincode',
                        //                 labelStyle: TextStyle(
                        //                     color: Color(0xFF007981),
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 15),
                        //                 hintText: 'Enter pincode',
                        //                 hintStyle:
                        //                 TextStyle(color: Colors.grey[700])),
                        //             controller: pincode,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 65),
                        //   child: RadioListTile(
                        //     title: Text(
                        //       'Current location',
                        //       style: TextStyle(color: Color(0xFF007981)),
                        //     ),
                        //     activeColor: Color(0xE610F1FF),
                        //     value: 'current',
                        //     groupValue: location,
                        //     onChanged: (String? value) {
                        //       // mapviewnear();
                        //       setState(() {
                        //         location = value;
                        //         if (location == value) {
                        //           // setState(() {
                        //           //   isVisible = true;
                        //           // });
                        //         }
                        //         // else{
                        //         //   setState(() {
                        //         //     isVisible = true;
                        //         //   });
                        //         // }
                        //       });
                        //     },
                        //   ),
                        // ),
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => mapviewnear(),
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
                        SizedBox(
                          height: 13,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have An Account? ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            InkWell(
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                              },
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Column(
                    // mainAxisSize: MainAxisSize.max,
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
                                    height: 180,
                                    width: 180,
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
                                    height: 140,
                                    width: 140,
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
        ),
      ),
    );
  }
}
