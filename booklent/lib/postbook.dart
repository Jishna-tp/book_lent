import 'dart:convert';

import 'package:booklent/login.dart';
import 'package:booklent/signup.dart';
import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';



class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late TextEditingController bookname,authorname,bio;
  // var objfile,fil,photo;
  // file_up() async {
  //   print('added successfully');
  //   var result = await FilePicker.platform.pickFiles(withReadStream: true);
  //   if (result != null) {
  //     // var fil=result.files.single.path;
  //     setState(() {
  //       fil= result.files.first.name;
  //       objfile = result.files.single;
  //       photo.text=fil;
  //     });
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  @override

  void initState(){
    bookname=TextEditingController();
    authorname =TextEditingController();
    bio=TextEditingController();
    super.initState();
  }

  void postdata()async {
    String url="http://192.168.43.200:8000/userpost/books/";
    var resp=await post(url,body:{
      "book_name":bookname.text.toString(),
      "author_name":authorname.text.toString(),
      "bio":bio.text.toString(),
      "genid":choosevalue,
      "uid":Login.uid
    });
    print(Login.uid);
  }
  String choosevalue="";
  late List data;
  void List_function() async {
    var url = Uri.parse("http://192.168.43.200:8000/genre/genview/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    setState(() {

    });
    print(resp1.body);
  }

  Widget build(BuildContext context) {
    List_function();
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
            'Add Post',
            style: TextStyle(
                color: Color.fromARGB(240, 0, 120, 129),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xE688F8FF),
        elevation: 5.0,
      ),
      backgroundColor: Colors.cyan[50],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.transparent)),
                      labelText: 'Name of Book',
                      labelStyle: TextStyle(
                          color: Color(0xFF007981),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      hintText: 'Enter book name',
                      hintStyle: TextStyle(color: Colors.grey[700])),
                  controller: bookname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.transparent)),
                      labelText: 'Author name',
                      labelStyle: TextStyle(
                          color: Color(0xFF007981),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      hintText: 'Enter Author name',
                      hintStyle: TextStyle(color: Colors.grey[700])),
                  controller: authorname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 50),
                child:
                DropdownButtonFormField(
                  value: choosevalue.isNotEmpty ? choosevalue : null,
                  onChanged: (newvalue) {
                    setState(() {
                      choosevalue = newvalue as String;
                    });
                  },
                  items: data
                      .map((e) => DropdownMenuItem(
                    child: Text(e['genre_name'].toString()),
                    value: e['genre_id'].toString(),
                  ))
                      .toList(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(240, 0, 120, 129),
                  ),
                  dropdownColor: Colors.cyan[50],
                  decoration: InputDecoration(labelText: "Genre"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Bio",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: bio,
                  ),
                ),
              ),

              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 1.0),
              //   width: double.infinity,
              //   child: MaterialButton(
              //     elevation: 5.0,
              //     onPressed: () {
              //       // file_up();
              //     },
              //     padding: EdgeInsets.all(15.15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) , topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
              //       //borderRadius: BorderRadius.only()
              //     ),
              //     color: Colors.white,
              //     child: Text(
              //       'pick one photo as your profile pic ',
              //       style: TextStyle(
              //         color: Color(0xFF072850),
              //         letterSpacing: 1.5,
              //         fontSize: 14.0,
              //         fontWeight: FontWeight.bold,
              //         fontFamily: 'OpenSans',
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF88F8FF)),
                onPressed: () {
                  postdata();
                  showDialog(context: context, builder: (context) => AlertDialog(
                      content: Text("Added successfully.")));
                  Post();
                },
                child: Text(
                  'Post',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
