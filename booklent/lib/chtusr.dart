import 'dart:convert';
import 'package:booklent/new_chat.dart';
import 'package:http/http.dart';
import 'package:booklent/home.dart';
import 'package:booklent/login.dart';
import 'package:flutter/material.dart';


class chtusr extends StatefulWidget {
  const chtusr({Key? key}) : super(key: key);

  @override
  State<chtusr> createState() => _chtusrState();
}

class _chtusrState extends State<chtusr> {
  late List data;
  void List_books() async {
    var url = Uri.parse(Login.url+"chat/main/");
    Response resp1 = await post(url,body: {
      "uid":Login.uid
    });
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
    List_books();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) => userdraw()));
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
            'chat',
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
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
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
                              new Text(""+" "+data[index]['uname'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              //
                              new Text(('' ).toUpperCase()+" "+data[index]['first_msg'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),
                              //
                              new Text(('' ).toUpperCase()+" "+data[index]['bknm'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),
                              ElevatedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFF88F8FF)),
                                onPressed: () {
                                  community.chatid=data[index]['chat_id'].toString();
                                  community.rcid=data[index]['usid'].toString();
                                  community.bid=data[index]['bkid'].toString();
                                  community.tp=data[index]['type'].toString();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext) => community()));
                                  // print("hello");
                                  // postdata(outputList[index]['book_id'].toString());
                                  // print(outputList[index]['book_id'].toString());
                                },
                                child: Text(
                                  'chat',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),

                              //
                              // new Text(('Location:' ).toUpperCase()+" "+data[index]['location'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              // new Text(('Contact No:' ).toUpperCase()+" "+data[index]['contact_no'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              // new Text(('Type:' ).toUpperCase()+" "+data[index]['type'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              // new Text(('Manager:' ).toUpperCase()+" "+data[index]['m_id'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              // new Text(('Status:' ).toUpperCase()+" "+data[index]['status'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
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
    );
  }
}
