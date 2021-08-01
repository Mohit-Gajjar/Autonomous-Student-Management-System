import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // static const _initialCameraPosition = CameraPosition(
  //     target: LatLng(22.355062425570594, 73.20370117106386), zoom: 10);

  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyBAtfe6z06bjffs7mzc61-E3xnXhuBjxYw');
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              getHttp();
            });
          },
          child: Text("Press"),
        ),
      ),
    ));
  }
}
