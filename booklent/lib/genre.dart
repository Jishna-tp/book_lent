import 'dart:convert';

import 'package:booklent/home.dart';
import 'package:booklent/imgrecog.dart';
import 'package:booklent/login.dart';
import 'package:booklent/signup.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class genre extends StatefulWidget {
  genre({super.key});

  @override
  State<genre> createState() => _genreState();
  static var genid="";
}

class _genreState extends State<genre> {

  var ischeck = [] ;
  var jselected=[];
  late List data;
  late List outputList;
  var len=0;
  late TextEditingController filt;
  bool isSearching = false;

  void List_function() async {
    var url = Uri.parse(Login.url+"genre/genview/");
    Response resp1 = await get(url);
    // data = jsonDecode(resp1.body);
    setState(() {
      data = jsonDecode(resp1.body);
      outputList=data;
      len=outputList.length;
      // print(len);
      isSearching = false;
      for(int i=0;i<len;i++)
        {
          ischeck.add(false);
        }
    });
    // print(resp1.body);
  }
  void postdata()async {
    print('helloooo');
    String url=Login.url+"genreselect/selectgen/";
    for(var o in jselected) {
      // print(o);
      var resp = await post(url, body: {
        "uid": signup.regid,
        // "uid": "1",
        "genid": o
      });
    }
    print('ok');
    // genre.genid=resp.body;
    // print(signup.regid);
    // print(genre.genid);
  }

  void initState(){
    List_function();
    filt=TextEditingController();
    setState(() {
      isSearching = true;
    });
  }

  void clearSearch(){
    setState(() {
      List_function();
      filt.clear();
      outputList.clear();
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List_function();
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
                        'Choose any 3 categories that you enjoy reading. This will help us recommend stories you will love.',
                        style: TextStyle(
                            color: Color(0xFF007981),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: TextField(
                      controller: filt,
                      onChanged: (data1){
                          if (data1!="")
                          {
                            setState(() {
                            outputList = data.where((o) => o['genre_name'].contains(data1)).toList();
                            // outputList = data.where((o) => o['name']==data1).toList();
                            });
                          }
                          else
                          {
                            setState(() {
                            outputList=data;
                            });
                          }

                          // print(data);
                          },
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        hintText: 'Search...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green[800],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.green[800],
                          ),
                          onPressed: (){
                            clearSearch();
                          }
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.cyan[100],
                      ),
                    ),

                  ),
                ],
              ),
              Expanded(
                    child: ListView.builder(
                      itemCount: outputList == null ? 0 : outputList.length,
                      // itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                          child: InkWell(
                            onTap: (){
                              // postdata();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => logscan(),
                              ));
                            },
                            child: Card(
                              color: Colors.cyan[50],
                              shadowColor: Color(0xE688F8FF),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:
                                        <Widget>[
                                          // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                                          Text(outputList[index]['genre_name'].toString(),
                                            // style: Theme
                                            //   .of(context)
                                            //   .textTheme
                                            //   .titleMedium,
                                            style: TextStyle(
                                                color: Color(0xFF007981),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          // Text(data[index].genre_name.toString())



                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Checkbox(
                                        activeColor: Colors.cyan[100],
                                        checkColor: Colors.blue,
                                        value: ischeck[index],
                                        onChanged: ((val) {
                                          setState(() {
                                            ischeck[index] = val;
                                            if(val!)
                                              {
                                                jselected.add(outputList[index]['genre_id'].toString());
                                                // print('helloo');
                                                // print(jselected);
                                              }
                                            else
                                              {
                                                jselected.remove(outputList[index]['genre_id'].toString());
                                                // print('helloo');
                                                // print(jselected);
                                              }
                                          });
                                        }),
                                      ),
                                      // ElevatedButton(
                                      //   style: OutlinedButton.styleFrom(
                                      //       backgroundColor: Color(0xFF88F8FF)),
                                      //   onPressed: () {
                                      //     postdata(outputList[index]['genre_id'].toString());
                                      //     Navigator.of(context).push(MaterialPageRoute(
                                      //       builder: (context) => UserHome(),
                                      //     ));
                                      //   },
                                      //   child: Text(
                                      //     'Select',
                                      //     style: TextStyle(
                                      //         color: Colors.black,
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: 15),
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                            ),
                          ),
                        );
                      },
                    )
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF88F8FF)),
                onPressed: () {
                  postdata();
                  print('asdf');
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => logscan(),
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
              // Expanded(
              //     child:
              //     Container(
              //       // color: Colors.teal[50],
              //       // width: 200,
              //       // height: 50,
              //   padding: EdgeInsets.only(bottom: 8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.only(left: 8, right: 8),
              //         child: Text(
              //           'genre',
              //           style: TextStyle(
              //               color: Color(0xFF007981),
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(top: 8,right: 8),
              //         child: ElevatedButton(
              //             style: OutlinedButton.styleFrom(
              //                 backgroundColor: Color(0xFF88F8FF)),
              //             onPressed: (() {
              //               Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => UserHome(),
              //               ));
              //             }),
              //             child: Text(
              //               'Select',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 15),
              //             )),
              //       )
              //     ],
              //   ),
              // ),
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
