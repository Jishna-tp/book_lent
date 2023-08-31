import 'package:booklent/home.dart';
import 'package:booklent/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'dart:convert';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  late List data;
  void List_books() async {
    var url = Uri.parse(Login.url + "rent/vwrt/");
    Response resp1 = await post(url, body: {"uid": Login.uid});
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }

  void approve(rid) async {
    var url = Uri.parse(Login.url + "rent/aprv/");
    Response resp1 = await post(url, body: {"rid": rid});
  }

  void reject(rid) async {
    var url = Uri.parse(Login.url + "rent/rej/");
    Response resp1 = await post(url, body: {"rid": rid});
  }

  @override
  Widget build(BuildContext context) {
    List_books();
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
            'Request',
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
                  borderRadius: new BorderRadius.circular(16.0)),
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
                          new Text(
                            "Book name:" +
                                " " +
                                data[index]['book_name'].toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          new SizedBox(height: 6.0),
                          //
                          new Text(
                              ('Rent date:').toUpperCase() +
                                  " " +
                                  data[index]['date'].toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          new SizedBox(height: 6.0),
                          //
                          new Text(
                              ('Return date:').toUpperCase() +
                                  " " +
                                  data[index]['return_date'].toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          new SizedBox(height: 6.0),
                          new Text(
                              ('Amount:').toUpperCase() +
                                  " " +
                                  data[index]['amount'].toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          new SizedBox(height: 6.0),
                          new Text(
                              ('Borrower name:').toUpperCase() +
                                  " " +
                                  data[index]['boorower_name'].toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          new SizedBox(height: 6.0),
                          new Text(
                              ('Status:').toUpperCase() +
                                  " " +
                                  data[index]['status'].toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xFF88F8FF)),
                            onPressed: () {
                              // postdata();
                              approve(data[index]['rnt_id'].toString());
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => genre(),
                              // ));
                            },
                            child: Text(
                              'Approved',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xFF88F8FF)),
                            onPressed: () {
                              reject(data[index]['rnt_id'].toString());
                              // postdata();
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => genre(),
                              // ));
                            },
                            child: Text(
                              'Reject',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
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
      )),
    );
  }
}
