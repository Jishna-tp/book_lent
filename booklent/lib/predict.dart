import 'package:booklent/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'home.dart';
import 'dart:convert';

class predict extends StatefulWidget {
  const predict({Key? key}) : super(key: key);

  @override
  State<predict> createState() => _predictState();
}

class _predictState extends State<predict> {
  late TextEditingController age,gender,author;
  List dropList =[
    {"genre_id":0, "genre_name": "Adventure"},
    {"genre_id":1, "genre_name": "Humour"},
    {"genre_id":2, "genre_name": "Horror"},
    {"genre_id":3, "genre_name": "Travel"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  List dropList1 =[
    {"gen":0, "gender": "Male"},
    {"gen":1, "gender": "female"},
    {"gen":2, "gender": "other"},
    // {"genre_id":3, "genre_name": "Travel"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey1=GlobalKey<FormState>();
  var val1=true;
  var dropdownValue1 = "";
  List dropList2 =[
    {"a_id":0, "author": "J K Rowling"},
    {"a_id":1, "author": "William shakespeare"},
    {"a_id":2, "author": "Arundhati Roy"},
    {"a_id":3, "author": "Rabindranath Tagore"},
    // {"genre_id":3, "genre_name": "Travel"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey2=GlobalKey<FormState>();
  var val2=true;
  var dropdownValue2 = "";
  @override
  void initState(){
    gender=TextEditingController();
    age=TextEditingController();
    author=TextEditingController();
    super.initState();
  }
  var res;
  void postdata()async {
    String url = Login.url+ "userpost/pre/";
    var resp = await post(url,body:{
      "age":age.text.toString(),
      "gender":dropdownValue1,
      "author":dropdownValue2,
      "gen":dropdownValue,
      "uid":Login.uid
    });
    this.setState(() {
      res=resp.body.toString();
      print(res);
    });

  }

  @override
  Widget build(BuildContext context) {
    // gendrop();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            'Booklent',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xE688F8FF),
        elevation: 5.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) => userdraw()));
            },
            icon: Icon(
              Icons.menu,
              size: 40,
            )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ),
            ),
          )
        ],
        iconTheme: IconThemeData(color: Color.fromARGB(240, 0, 120, 129)),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.transparent)),
                      labelText: 'Age',
                      labelStyle: TextStyle(
                          color: Color(0xFF007981),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      hintText: 'Enter age',
                      hintStyle: TextStyle(color: Colors.grey[700])),
                  controller: age,
                ),
              ),
              Container( //dropdown
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                  ),
                  child: DropdownButtonFormField(
                      hint: Text("select the author"),
                      onChanged: ( newValue) {
                        setState(() {
                          dropdownValue2 = newValue.toString();
                          print(dropdownValue2);
                        });
                      },
                      items: dropList2.map((item) => DropdownMenuItem(child: Text(item['author'].toString()),value:item['a_id'].toString(),)).toList()
                  )
              ),
              Container( //dropdown
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                  ),
                  child: DropdownButtonFormField(
                      hint: Text("select the genre"),
                      onChanged: ( newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();
                          print(dropdownValue);
                        });
                      },
                      items: dropList.map((item) => DropdownMenuItem(child: Text(item['genre_name'].toString()),value:item['genre_id'].toString(),)).toList()
                  )
              ),
              Container( //dropdown
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                  ),
                  child: DropdownButtonFormField(
                      hint: Text("select the gender"),
                      onChanged: ( newValue) {
                        setState(() {
                          dropdownValue1 = newValue.toString();
                          print(dropdownValue1);
                        });
                      },
                      items: dropList1.map((item) => DropdownMenuItem(child: Text(item['gender'].toString()),value:item['gen'].toString(),)).toList()
                  )
              ),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF88F8FF)),
                onPressed: () {
                  postdata();
                },
                child: Text(
                  'Predict',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.transparent)),
                      labelText: res,
                      labelStyle: TextStyle(
                          color: Color(0xFF007981),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      hintText: res,
                      hintStyle: TextStyle(color: Colors.grey[700])),
                  // controller: age,
                ),
              ),
              // Container(
              //   child: Text(res),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
