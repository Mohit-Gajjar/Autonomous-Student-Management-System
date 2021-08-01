
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  GoogleMapController? mapController;
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(22.344428, 73.201394), zoom: 11.5);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            bottom: 50,
            right: 10, child:ElevatedButton(child:Icon(Icons.pin_drop_outlined,color: Colors.green,) ,onPressed: (){},)
           )
        ],
      ),
    );
  }

  // _onMapCreated(GoogleMapController controller) {
  //   setState(() {
  //     mapController = controller;
  //   });
  // }
  

  // GoogleMap(
  //           initialCameraPosition: _initialCameraPosition,
  //           onMapCreated: _onMapCreated,
  //           myLocationEnabled: true,
  //           mapType: MapType.satellite,
  //           compassEnabled: true,
  //         ),

  // void _addMaker() {
  //   var marker = Marker(
  //     // markerId: mapController!.mapId,
  //     position: mapController.getScreenCoordinate(_initialCameraPosition)
  //   );
  // }
}
//  body: GoogleMap(
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         initialCameraPosition: _initialCameraPosition),