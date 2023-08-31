import 'dart:io';
import 'package:booklent/user.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'login.dart';



class logscan extends StatefulWidget {
  @override
  _logscanState createState() => _logscanState();
}

class _logscanState extends State<logscan> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  var nm = " ";
  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![1], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture Image from Camera"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(children: [
              Container(
                  height: 300,
                  width: 400,
                  child: controller == null
                      ? Center(child: Text("Loading Camera..."))
                      : !controller!.value.isInitialized
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : CameraPreview(controller!)),
              ElevatedButton.icon(
                //image capture button
                onPressed: () async {
                  try {
                    if (controller != null) {
                      if (controller!.value.isInitialized) {
                        image = await controller!.takePicture(); //capture image
                        setState(() async {
                          nm = image!.path;
                          final request = MultipartRequest(
                            "POST",
                            Uri.parse(Login.url+"register/imgrec/"),
                          );
                          MultipartFile multipartFile =
                          await MultipartFile.fromPath('file', nm);
                          request.files.add(multipartFile);
                          StreamedResponse response = await request.send();
                          var resp = await Response.fromStream(response);
                          print(resp.body);
                          if(resp.body=="yess"){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(content: Text("you have successfully Registered. Now you can login")));
                          }
                          else{
                            showDialog(context: context, builder: (context) => AlertDialog(
                                content: Text("Capture face Properly")));
                          }
                        });

                      }
                    }
                  } catch (e) {
                    print(e); //show error
                  }
                },
                icon: Icon(Icons.camera),
                label: Text("Capture"),
              ),
              Container(
                //show captured image
                padding: EdgeInsets.all(30),
                child: image == null
                    ? Text(nm)
                    : Image.file(
                  File(image!.path),
                  height: 300,
                ),

                //display captured image
              )
            ])),
      ),
    );
  }
}
