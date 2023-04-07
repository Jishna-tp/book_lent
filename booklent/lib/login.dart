import 'dart:convert';

import 'package:booklent/admin.dart';
import 'package:booklent/forgot_pw.dart';
import 'package:booklent/home.dart';
import 'package:booklent/signup.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController t1 = TextEditingController();

  // final username = TextEditingController(text: '');
  // final password = TextEditingController(text: '');

  bool? isremember = false;

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

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'images/logo3.png',
                      ),
                    ),

                    Text(
                      'WELCOME BACK !',
                      style: TextStyle(
                          color: Color(0xFF007981),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please Enter your Details',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                color: Color(0xFF007981),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            hintText: 'Enter username',
                            hintStyle: TextStyle(color: Colors.grey[700])),
                        // controller: username,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
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
                        // controller: password,
                      ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Color(0xFF88F8FF),
                                checkColor: Color(0xFF007981),
                                value: isremember,
                                onChanged: ((value) {
                                  setState(() {
                                    isremember = value;
                                  });
                                })),
                            Text(
                              'Remember me',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        InkWell(
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Passwordchange(),
                            ));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF88F8FF)),
                      onPressed: () {
                        // postData(username.text, password.text);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserHome(),
                        ));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have An Account? ",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => signup(),
                            ));
                          },
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
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

class Idgen {
  String? username;
  String? category;

  Idgen({this.username, this.category});

  factory Idgen.fromJson(Map<String, dynamic> json) {
    return Idgen(username: json['username'], category: json['category']);
  }
}
