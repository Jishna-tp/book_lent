import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0x3375F7FF),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/topimg.png'),
            )),
          ),
          Container(
            alignment: Alignment.bottomRight,
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/bottomimg.png'),
            )),
          ),
        ],
      ),
    ));
  }
}
