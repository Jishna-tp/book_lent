import 'package:booklent/chat.dart';
import 'package:booklent/chtusr.dart';
import 'package:booklent/home.dart';
import 'package:booklent/new_chat.dart';
import 'package:booklent/notification.dart';
import 'package:booklent/postbook.dart';
import 'package:booklent/savedbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int currentTab = 0;
  final List<Widget> screens = [home(), saved(), notification(), chtusr() ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(240, 0, 120, 129),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Post(),
          ));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 164, 240, 250),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = home();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? Colors.green[900]
                              : Color.fromARGB(240, 0, 120, 129),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = saved();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_sharp,
                          color: currentTab == 1
                              ? Colors.green[900]
                              : Color.fromARGB(240, 0, 120, 129),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = notification();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2
                              ? Colors.green[900]
                              : Color.fromARGB(240, 0, 120, 129),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = chtusr();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 4
                              ? Colors.green[900]
                              : Color.fromARGB(240, 0, 120, 129),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
