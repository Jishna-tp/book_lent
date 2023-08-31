
import 'dart:convert';

import 'package:booklent/genre.dart';
import 'package:booklent/login.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:google_place/google_place.dart';
import "package:google_maps_webservice/places.dart";
import 'package:http/http.dart';
// import 'package:travelgenics1/layout/login.dart';

class mapviewnear extends StatefulWidget {
  @override
  _mapviewnearState createState() => _mapviewnearState();
}

class _mapviewnearState extends State<mapviewnear> {
  late GoogleMapController gmapcontroller;
  late Iterable _markers;

  Iterable markers = [];
  static List<Map<String, dynamic>> list =[];

//


  void showdata() async
  {

    bool serviceEnabled;
    LocationPermission permission;
    print('hello');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lat=position.latitude.toString();
    var lon =position.longitude.toString();
    var resp=await post(Login.url +"location/nwlc/",body: {"lat": lat,"lon": lon,"type":"hospital" });
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext) => genre()));
    late List data;
    data = jsonDecode(resp.body);

    for (var ob in data)
    {
      var itm={"title": ob['place'], "id": ob['id'].toString(), "lat": ob['lat1'], "lon": ob['lon1']};
      list.add(itm);
    }

    _markers = Iterable.generate(list.length, (index) {
      return Marker(
          markerId: MarkerId(list[index]['id']),
          position: LatLng(
            list[index]['lat'],
            list[index]['lon'],
          ),
          infoWindow: InfoWindow(title: list[index]["title"])
      );
    });
    setState(() {

      markers = _markers;
    });
  }





  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    showdata();
  }

  @override
  void dispose() {
    gmapcontroller.dispose();
    super.dispose();
  }




  static const intcacam = CameraPosition(

    target: LatLng(11.3880367, 75.7407629),
    zoom: 11.5,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: intcacam,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (controller)=>gmapcontroller=controller,
      markers: Set.from(markers),
    );
  }
}
