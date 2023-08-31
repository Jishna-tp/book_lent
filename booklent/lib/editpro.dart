import 'package:booklent/admin.dart';
import 'package:booklent/home.dart';
import 'package:booklent/login.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class editpro extends StatefulWidget {
  const editpro({Key? key}) : super(key: key);

  @override
  State<editpro> createState() => _editproState();
  static var drid="1";
}

class _editproState extends State<editpro> {
  late TextEditingController name,age,gender,phone,email,password,interest;
  int _value=1;
  var gen;
  @override
  void initState(){
    name=TextEditingController();
    age=TextEditingController();
    gender=TextEditingController();
    phone=TextEditingController();
    email=TextEditingController();
    password=TextEditingController();
    interest=TextEditingController();
    List_function();
    super.initState();

  }
  late List data;
  void List_function() async {
    var url = Uri.parse(Login.url+"register/ed/");
    Response resp1 = await post(url,body: {
      "drid":Login.uid,
    });
    data = jsonDecode(resp1.body);
    this.setState(() {
      name.text=data[0]["username"].toString();
      age.text=data[0]["age"].toString();
      gender.text=data[0]["gender"].toString();
      phone.text=data[0]["phone_no"].toString();
      email.text=data[0]["email"].toString();
      interest.text=data[0]["interest"].toString();
    });
    print(resp1.body);
  }

  void postdata() async {
    String url = Login.url+"register/tidt/";
    if (_value==1)
    {
      gen="male";
    }
    else if(_value==2)
    {
      gen="female";
    }
    var resp = await post(url, body: {
      "drid":Login.uid,
      "username": name.text.toString(),
      // "company name": name.text,
      "age": age.text.toString(),
      "gender": gen.toString(),
      "phone_no": phone.text.toString(),
      "email": email.text.toString(),
      "interest": interest.text.toString(),
      // "password": password.text.toString(),

    });
  }

  @override
  Widget build(BuildContext context) {
    // List_function();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        toolbarHeight: 70,
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xE688F8FF),
      ),
      body: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.horizontal(),
          color: Colors.cyan[50],
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   // alignment: ,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     radius: 40.0,
                //     backgroundImage: AssetImage('assets/b2.jpg'),
                //     // backgroundImage: ,
                //   ),
                // ),
                Container(
                  child: Text("Profile",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      //   child: TextFormField(
                      //     controller: name,
                      //     decoration: InputDecoration(
                      //       labelText: "Name",
                      //       prefixIcon: Icon(Icons.people),
                      //       // border: OutlineInputBorder(
                      //       //   borderRadius: BorderRadius.vertical(),
                      //       // )
                      //     ),
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: TextFormField(
                          controller: age,
                          decoration: InputDecoration(
                            labelText: "Age",
                            prefixIcon: Icon(Icons.numbers),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.vertical(),
                            // )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(70, 0, 30, 10), //3rd

                        // width: 350.0,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     border: Border.all(color: Colors.black)
                        // ),

                        child: Column(
                          children: [
                            Row(

                              children: [
                                Text("Gender"),
                                Radio(
                                    value: 1,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = 1;
                                      });
                                    }),
                                Text("Male"),
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = 2;
                                    });
                                  },
                                ),
                                Text("Female"),
                              ],
                            )
                          ],
                        ), //1st
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: TextFormField(
                          controller: interest,
                          decoration: InputDecoration(
                            labelText: "Interest",
                            prefixIcon: Icon(Icons.dehaze),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.vertical(),
                            // )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                            labelText: "Phone",
                            prefixIcon: Icon(Icons.phone_android),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.vertical(),
                            // )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.vertical(),
                            // )
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                      //   child: TextFormField(
                      //     controller: password,
                      //     decoration: InputDecoration(
                      //       labelText: "Password",
                      //       prefixIcon: Icon(Icons.password),
                      //       // border: OutlineInputBorder(
                      //       //   borderRadius: BorderRadius.vertical(),
                      //       // )
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   width: 200,
                      //   // color: Colors.cyan,
                      //   padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      //   child: ElevatedButton
                      //     (onPressed: () {
                      //     // postdata();
                      //     // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => login()));
                      //   },
                      //     style: ElevatedButton.styleFrom(
                      //       primary: Colors.cyan, // Background color
                      //     ),
                      //     child: Text("Login"),
                      //   ),
                      // ),
                      Container(
                        width: 200,
                        // color: Colors.cyan,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                        child: ElevatedButton
                          (onPressed: () {
                          postdata();
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserHome()));
                        },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan, // Background color
                          ),
                          child: Text("Update"),
                        ),
                      ),


                    ],
                  ),
                )

              ],

            ),
          ),
        ),
      ),



    );
  }
}