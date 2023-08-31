import 'package:booklent/login.dart';
import 'package:booklent/rent_req_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:file_picker/file_picker.dart';

import 'exch_req_form.dart';
class community extends StatefulWidget {
  const community({Key? key}) : super(key: key);

  @override
  State<community> createState() => _communityState();
  static var rcid="";
  static var bid="";
  static var tp="";
  static var chatid="";
}

class _communityState extends State<community> {
  late TextEditingController msg;
  late List data;
  @override
  void initState() {
    // TODO: implement initState
    msg = TextEditingController();
    super.initState();
  }
  void postdata() async {
    var url1 = Uri.parse(Login.url + "chat/inschat/");
    //String url ="";s
    Response resp = await post(url1, body: {
      "msg": msg.text.toString(),
      "chid":community.chatid.toString(),
      "rcid":community.rcid,
      "bid":community.bid,
      "tp":community.tp,
      // "img":img.text.toString(),
      "uid":Login.uid
      // "pswd":password.text.toString(),
    });
    msg.text="";
  }
  void list_view() async{
    var url = Uri.parse(Login.url+"chat/vw/");
    Response resp1 = await post(url,body: {
      "uid":Login.uid,
      "bkid":community.bid
    });
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    list_view();
    return Scaffold(
      // bottomNavigationBar:appfooter(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 2, 33, 1),
        title: Text("Chat",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 221, 90, 169)),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Expanded(
                    child: TextFormField(
                      controller: msg,
                      decoration: InputDecoration(
                          hintText: "Message",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(10,0, 0, 0),
                //   child: RaisedButton(
                //     onPressed: () {
                //       file_up();
                //     },
                //     color: Colors.white,
                //     child: Text("pic"),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ElevatedButton(
                    onPressed: () {
                      postdata();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 10, 2, 48),
                      shadowColor: Colors.amberAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text("Post",
                      style: TextStyle(
                          color: Color.fromARGB(255, 230, 83, 10)
                      ),),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          postdata();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => rent_req()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 10, 2, 48),
                          shadowColor: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: Text("RENT",
                          style: TextStyle(
                              color: Color.fromARGB(255, 230, 83, 10)
                          ),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          postdata();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => exch_req()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 10, 2, 48),
                          shadowColor: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: Text("Exchange",
                          style: TextStyle(
                              color: Color.fromARGB(255, 230, 83, 10)
                          ),),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Container(
              child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return new Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: new Card(
                        child: Column(
                          children: [
                            new SizedBox(height: 8),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 10.0,
                                  backgroundImage: AssetImage('asset/q.png'),
                                ),
                                new Text(('' )+" "+data[index]['message'].toString(), style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium
                                ),
                                new SizedBox(height: 6.0),
                              ],
                            ),
                            // new Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     Image.network(login.url+"static/"+data[index]['img'].toString(),height: 10,width: 10,),
                            //   ],
                            // ),
                            new SizedBox(height: 6),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
