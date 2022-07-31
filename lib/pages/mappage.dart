// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unnecessary_this

import 'dart:async';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:c300drowningdetection/helpers/utils.dart';
import 'package:c300drowningdetection/models/sublocation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/drowncheck.dart';

const LatLng SOURCE_LOCATION = LatLng(1.4345187789881595, 103.77953147513655);
const LatLng DEST_LOCATION = LatLng(42.743902, -71.170009);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 60;
const double CAMERA_BEARING = 30;

class MapPage extends StatefulWidget {
  //MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

  late LatLng currentLocation;
  late LatLng destinationLocation;

  List<Marker> markerss = [];

  @override
  void initState() {
    intilize();
    super.initState();
    const DrownCheck().drownCheck;

    // Setting initial Location
  }

  intilize() {
    Marker Marker1 = Marker(
      markerId: MarkerId('Woodlands'),
      position: LatLng(1.434430293831611, 103.77953147513655),
      infoWindow: InfoWindow(title: 'Woodlands Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker2 = Marker(
      markerId: MarkerId('Yi Shun'),
      position: LatLng(1.4240208115155686, 103.83409281006826),
      infoWindow: InfoWindow(title: 'Yishun swimming complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker3 = Marker(
      markerId: MarkerId('Ang Mo Kio'),
      position: LatLng(1.3632900895496858, 103.849917130967),
      infoWindow: InfoWindow(title: 'Ang Mo Kio Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker4 = Marker(
      markerId: MarkerId('Hougang'),
      position: LatLng(1.369990850871825, 103.88727823559782),
      infoWindow: InfoWindow(title: 'Hougang Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker5 = Marker(
      markerId: MarkerId('Sengkang'),
      position: LatLng(1.396355233165806, 103.88629597593611),
      infoWindow: InfoWindow(title: 'Sengkang Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker6 = Marker(
      markerId: MarkerId('Yio Chu Kang'),
      position: LatLng(1.3817754954545938, 103.84657984610516),
      infoWindow: InfoWindow(title: 'Yio Chu Kang Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker7 = Marker(
      markerId: MarkerId('Delta'),
      position: LatLng(1.2892344328616048, 103.81973540705928),
      infoWindow: InfoWindow(title: 'Delta swimming complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker8 = Marker(
      markerId: MarkerId('Bedok ActiveSG'),
      position: LatLng(1.3272346640139023, 103.9322438837943),
      infoWindow:
          InfoWindow(title: 'Heartbeat @ Bedok ActiveSG Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker9 = Marker(
      markerId: MarkerId('Pasir Ris'),
      position: LatLng(1.3743832904841113, 103.95212643521916),
      infoWindow: InfoWindow(title: 'Pasir Ris Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker10 = Marker(
      markerId: MarkerId('Tampines'),
      position: LatLng(1.3530764934902768, 103.94033729475593),
      infoWindow: InfoWindow(title: 'Tampines Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker11 = Marker(
      markerId: MarkerId('Bukit Batok'),
      position: LatLng(1.3446482024624324, 103.7486073381792),
      infoWindow: InfoWindow(title: 'Bukit Batok Swimming Complex '),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker12 = Marker(
      markerId: MarkerId('Choa Chu Kang'),
      position: LatLng(1.3911713449646292, 103.74827477545645),
      infoWindow: InfoWindow(title: 'Choa Chu Kang Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker13 = Marker(
      markerId: MarkerId('Clementi'),
      position: LatLng(1.3108197488656343, 103.76564696304602),
      infoWindow: InfoWindow(title: 'Clementi Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker14 = Marker(
      markerId: MarkerId('Jurong East'),
      position: LatLng(1.3467637079354224, 103.7286408808192),
      infoWindow: InfoWindow(title: 'Jurong East Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker15 = Marker(
      markerId: MarkerId('Jurong Lake Gardens'),
      position: LatLng(1.3303962503354487, 103.72558649985692),
      infoWindow: InfoWindow(title: 'Jurong Lake Garden'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker16 = Marker(
      markerId: MarkerId('Jurong West'),
      position: LatLng(1.338016946399475, 103.69337431642461),
      infoWindow: InfoWindow(title: 'Jurong West Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker17 = Marker(
      markerId: MarkerId('Senja-Cashew'),
      position: LatLng(1.3820195602281908, 103.76459143902355),
      infoWindow: InfoWindow(title: 'Senja Cashew Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker18 = Marker(
      markerId: MarkerId('Bishan'),
      position: LatLng(1.35429504525964, 103.85014609069577),
      infoWindow: InfoWindow(title: 'Bishan Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker19 = Marker(
      markerId: MarkerId('Geylang East'),
      position: LatLng(1.32133149227945, 103.88784453672035),
      infoWindow: InfoWindow(title: 'Geylang East Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker20 = Marker(
      markerId: MarkerId('Jalan Besar'),
      position: LatLng(1.3102704760381039, 103.85970216030182),
      infoWindow: InfoWindow(title: 'Jalan Besar Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker21 = Marker(
      markerId: MarkerId('Katong'),
      position: LatLng(1.3021925708996918, 103.88613712899185),
      infoWindow: InfoWindow(title: 'Katong Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker22 = Marker(
      markerId: MarkerId('MOE Evans'),
      position: LatLng(1.3183520917668439, 103.81956443737032),
      infoWindow: InfoWindow(title: 'MOE Evans Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker23 = Marker(
      markerId: MarkerId('Queenstown'),
      position: LatLng(1.2971346458752762, 103.80275715763192),
      infoWindow: InfoWindow(title: 'Queenstown Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker24 = Marker(
      markerId: MarkerId('Serangoon'),
      position: LatLng(1.3572299236941352, 103.87467500712056),
      infoWindow: InfoWindow(title: 'Serangoon Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Marker Marker25 = Marker(
      markerId: MarkerId('Toa Payoh'),
      position: LatLng(1.3305698268606874, 103.85047012057107),
      infoWindow: InfoWindow(title: 'Toa Payoh Swimming Complex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    markerss.add(Marker1);
    markerss.add(Marker2);
    markerss.add(Marker3);
    markerss.add(Marker4);
    markerss.add(Marker5);
    markerss.add(Marker6);
    markerss.add(Marker7);
    markerss.add(Marker8);
    markerss.add(Marker9);
    markerss.add(Marker10);
    markerss.add(Marker11);
    markerss.add(Marker12);
    markerss.add(Marker13);
    markerss.add(Marker14);
    markerss.add(Marker15);
    markerss.add(Marker16);
    markerss.add(Marker17);
    markerss.add(Marker18);
    markerss.add(Marker19);
    markerss.add(Marker20);
    markerss.add(Marker21);
    markerss.add(Marker22);
    markerss.add(Marker23);
    markerss.add(Marker24);
    markerss.add(Marker25);

    setState(() {});
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
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    this.setSourceAndDestinationMarkerIcons();

    CameraPosition initialCameraPosition = const CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);

    return Scaffold(
        body: Stack(
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
        )),
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
                      offset: Offset.zero)
                ]),
            child: Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage('assets/imgs/human_icon.png'),
                            fit: BoxFit.cover),
                        border: Border.all(color: Colors.blue, width: 1))),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Me',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      Text(
                        'My Location',
                        style: TextStyle(color: Colors.blue),
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
    ));
  }
}
