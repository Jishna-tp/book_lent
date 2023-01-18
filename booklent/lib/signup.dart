import 'package:booklent/location.dart';
import 'package:booklent/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class signup extends StatelessWidget {
  const signup({super.key});

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
              // SizedBox(
              //   height: 10,
              // ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFF007981),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            labelText: 'User name',
                            labelStyle: TextStyle(
                                color: Color(0xFF007981),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            hintText: 'Enter username',
                            hintStyle: TextStyle(color: Colors.grey[700])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                                color: Color(0xFF007981),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            hintText: 'Enter phonenumber',
                            hintStyle: TextStyle(color: Colors.grey[700])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            labelText: 'Email Id',
                            labelStyle: TextStyle(
                                color: Color(0xFF007981),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            hintText: 'Enter emailid',
                            hintStyle: TextStyle(color: Colors.grey[700])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Color(0xFF007981),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            hintText: 'Enter password again',
                            hintStyle: TextStyle(color: Colors.grey[700])),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF88F8FF)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => location(),
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
