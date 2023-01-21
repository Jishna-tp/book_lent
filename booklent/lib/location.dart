import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  String? location;
  bool isVisible = true;

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
                  children: [
                    Text(
                      'Enter your Location',
                      style: TextStyle(
                          color: Color(0xFF007981),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 65),
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
                            isVisible = !isVisible;
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
                                  vertical: 20, horizontal: 50),
                              child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
                              child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
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
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xFF88F8FF)),
                              onPressed: () {},
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
