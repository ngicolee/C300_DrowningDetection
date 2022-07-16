import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng SOURCE_LOCATION = LatLng(1.4345187789881595, 103.77953147513655);
const LatLng DEST_LOCATION = LatLng(42.743902, -71.170009);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 60;
const double CAMERA_BEARING = 30;

class MapPage extends StatefulWidget {
 //  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor  sourceIcon;
  late BitmapDescriptor destinationIcon;

  late LatLng currentLocation;
  late LatLng destinationLocation;

  List<Marker> markerss = [];

  @override
  void initState() {
    intilize();
    super.initState();

    // Setting initial Location

    // Setting marker icon
    this.setSourceAndDestinationMarkerIcons();
  }

  intilize() {
    Marker firstMarker = Marker(
      markerId: MarkerId('firstmarker'),
      position: LatLng(1.4345187789881595, 103.77953147513655),
      infoWindow: InfoWindow(title: 'Source Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
      ),
    );

    Marker secordMarker = Marker(
      markerId: MarkerId('secondmarker'),
      position: LatLng(1.434430293831611, 103.77962267023948),
      infoWindow: InfoWindow(title: 'Destination Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    markerss.add(firstMarker);
    markerss.add(secordMarker);

    setState(() {
      
    });



  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/source_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/destination_pin.png');
  }

  void setInitialLocation() {
    currentLocation = LatLng(
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude
    );

    destinationLocation = LatLng(
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude
    );
  }



  @override
  Widget build(BuildContext context) {
    
    CameraPosition initialCameraPosition = const CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION
    );
    
    return Scaffold(
      body:  Stack(
        children: [
          Positioned.fill(
             child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                markers: markerss.map((e) => e).toSet(),
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {

                  _controller.complete(controller);


                },

              )
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset.zero
                  )
                ]
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/human_icon.png'),
                        fit: BoxFit.cover
                      ),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1
                      )
                    )
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Me',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),
                        Text('My Location',
                          style: TextStyle(
                            color: Colors.blue
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.location_pin,
                    color: Colors.lightGreenAccent[700],
                    size: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  
  
  
}
