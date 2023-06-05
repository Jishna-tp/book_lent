import 'package:booklent/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.cyan[50],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurpleAccent[100],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.deepPurpleAccent[100],
                  child: Text('New book is published by the publication.',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
