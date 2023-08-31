import 'package:booklent/post_noti_admin.dart';
import 'package:booklent/view_trans_admin.dart';
import 'package:booklent/view_users.dart';
import 'package:flutter/material.dart';
// import 'package:blind/layout/login.dart';

import 'login.dart';
// import 'package:fraudtrans/layouts/viewplot.dart';

//drawer: draw()
//import 'package:controlsapp/custcontrols/draw.dart';

class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  builder: (BuildContext) => admindraw()));
            },
            icon: Icon(
              Icons.menu,
              size: 40,
            )),

        iconTheme: IconThemeData(color: Color.fromARGB(240, 0, 120, 129)),
      ),
      backgroundColor: Colors.cyan[50],
    );

  }
}

class admindraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.cyan[50],
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage('images/logo3.png'),
                width: 200,
                height: 200,
              ),
              // decoration: BoxDecoration(
              //   color: Color(0xE688F8FF),
              // ),
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('View users'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => vusers()));
              },
            ),
            ListTile(
              leading: Icon(Icons.apartment_sharp),
              title: Text('Post Notification'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => post_noti_admin()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('View transcation'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => vtens_admin()));
              },
            ),

            // ListTile(
            //   leading: Icon(Icons.supervised_user_circle),
            //   title: Text('Rate doctor'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/rate');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}