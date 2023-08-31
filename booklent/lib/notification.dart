
import 'package:booklent/login.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
    late List data;
    var len=0;
    void List_books() async {
    print("hello");
    var url = Uri.parse(Login.url+"notification/notivw/");
    Response resp1 = await get(url);
    this.setState(() {
      data = jsonDecode(resp1.body);
      len=data.length;
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
    List_books();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Color.fromARGB(240, 0, 120, 129),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserHome(),
              ));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            )),
        toolbarHeight: 70,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.cyan[100],
        elevation: 5.0,
      ),
      body: Center(
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  color: Colors.purple[100],
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here

                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network("http://192.168.1.44:8000/static/"+data[index]['image'].toString()),
                              new Text(('New Book Published' ), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),
                              new Text("Book name:"+" "+data[index]['book'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              // new Text(('Author:' ).toUpperCase()+" "+data[index]['bkname'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     child: Column(
      //       children: [
      //         Container(
      //             child: new ListView.builder(
      //               itemCount: len,
      //               // itemCount: 2,
      //               itemBuilder: (context, index) {
      //                 return Text("hello");
      //                 return new Padding(
      //                   padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
      //                   child: new Card(
      //                     elevation: 2.0,
      //                     shape: new RoundedRectangleBorder(
      //                         borderRadius: new BorderRadius.circular(16.0)
      //                     ),
      //                     child: InkWell(
      //                       onTap: () {
      //                         print("tapped");
      //                         //  tap funtion here
      //
      //                       },
      //                       child: new Column(
      //                         children: <Widget>[
      //                           new Padding(
      //                             padding: new EdgeInsets.all(16.0),
      //                             child: new Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               crossAxisAlignment: CrossAxisAlignment.center,
      //                               children: <Widget>[
      //                                 // Image.network("http://192.168.1.44:8000/static/"+data[index]['image'].toString()),
      //                                 new Text("Notification:"+" "+data[index]['notification'].toString(), style: Theme
      //                                     .of(context)
      //                                     .textTheme
      //                                     .titleMedium,
      //                                 ),
      //                                 new SizedBox(height: 6.0),
      //                                 //
      //                                 new Text(('Book name:' ).toUpperCase()+" "+data[index]['bkname'].toString(), style: Theme
      //                                     .of(context)
      //                                     .textTheme
      //                                     .titleMedium
      //                                 ),
      //                                 new SizedBox(height: 6.0),
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //             )
      //         )
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}


//
// import 'package:booklent/login.dart';
// import 'package:booklent/user.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
//
// class notification extends StatefulWidget {
//   const notification({super.key});
//
//   @override
//   State<notification> createState() => _notificationState();
// }
// //
// // class _notificationState extends State<notification> {
// //   late List data;
// //   var len=0;
// //   void List_books() async {
// //     print("hello");
// //     var url = Uri.parse(Login.url+"notification/notivw/");
// //     Response resp1 = await get(url);
// //     this.setState(() {
// //       data = jsonDecode(resp1.body);
// //       len=data.length;
// //     });
// //     print(resp1.body);
// //   }
// //   @override
//   Widget build(BuildContext context) {
//     List_books();
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text("hello"),
//         leading: IconButton(
//             color: Color.fromARGB(240, 0, 120, 129),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => UserHome(),
//               ));
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               size: 40,
//             )),
//         toolbarHeight: 70,
//         shadowColor: Colors.transparent,
//         title: Center(
//           child: Text(
//             'Notifications',
//             style: TextStyle(
//                 color: Color.fromARGB(240, 0, 120, 129),
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: Colors.cyan[100],
//         elevation: 5.0,
//       ),
//       backgroundColor: Colors.cyan[50],
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                   child: new ListView.builder(
//                     itemCount: len,
//                     // itemCount: 2,
//                     itemBuilder: (context, index) {
//                       return Text("hello");
//                       return new Padding(
//                         padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
//                         child: new Card(
//                           elevation: 2.0,
//                           shape: new RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(16.0)
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               print("tapped");
//                               //  tap funtion here
//
//                             },
//                             child: new Column(
//                               children: <Widget>[
//                                 new Padding(
//                                   padding: new EdgeInsets.all(16.0),
//                                   child: new Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: <Widget>[
//                                       // Image.network("http://192.168.1.44:8000/static/"+data[index]['image'].toString()),
//                                       new Text("Notification:"+" "+data[index]['notification'].toString(), style: Theme
//                                           .of(context)
//                                           .textTheme
//                                           .titleMedium,
//                                       ),
//                                       new SizedBox(height: 6.0),
//                                       //
//                                       new Text(('Book name:' ).toUpperCase()+" "+data[index]['bkname'].toString(), style: Theme
//                                           .of(context)
//                                           .textTheme
//                                           .titleMedium
//                                       ),
//                                       new SizedBox(height: 6.0),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   )
//               )
//               // Padding(
//               //     padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.greenAccent[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.pink[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.purple[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.deepPurple[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.red[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.deepOrange[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.amber[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(10),
//               //       color: Colors.deepPurpleAccent[100],
//               //     ),
//               //     height: 80,
//               //     width: MediaQuery.of(context).size.width,
//               //     // color: Colors.deepPurpleAccent[100],
//               //     child: Text('New book is published by the publication.',style: TextStyle(
//               //       fontSize: 18,
//               //     ),),
//               //   ),
//               // ),
//               // Divider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
