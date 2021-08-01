import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool toggler = false;
  String mode(bool toggler) {
    var toogle = '';
    if (toggler == false) {
      toogle = 'Hybrid';
    } else {
      toogle = 'Normal';
    }
    return toogle;
  }

  MapType mapType = MapType.normal;
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: false,
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (toggler != false) {
                          toggler = false;
                        } else {
                          toggler = true;
                        }
                      });
                    },
                    child: Text(mode(toggler))),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              GoogleMap(
                mapType: toggler == true ? MapType.normal : MapType.hybrid,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: const LatLng(0, 0),
                  zoom: 2,
                ),
                markers: _markers.values.toSet(),
              ),
            ],
          ),
        ));
  }
}
