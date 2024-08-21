import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyPolyline extends StatefulWidget {
  const MyPolyline({super.key});

  @override
  State<MyPolyline> createState() => _MyPolylineState();
}

class _MyPolylineState extends State<MyPolyline> {

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(11.575108446478543, 104.91858354975695), zoom: 20,
  );
  final Set<Marker> myMarker = {};
  final Set<Polyline> _myPolyline = {};
  List<LatLng> myPoints = const [
    LatLng(11.575108446478543, 104.91858354975695),
    LatLng(11.574742207214285, 104.91863523811207),
    LatLng(11.574620338601207, 104.91912485733829),
    LatLng(11.574781267655945, 104.9180084617085),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int a = 0; a<myPoints.length; a++)
    {
      myMarker.add(
        Marker(
            markerId: MarkerId(a.toString()),
          position: myPoints[a],
          infoWindow: const InfoWindow(
            title: 'Adventures Place',
            snippet: '10 out 10 Star',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      setState(() {
        
      });
      _myPolyline.add(
        Polyline(polylineId: PolylineId('First'),
          points: myPoints,
          color: Colors.cyan,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Polyline'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: GoogleMap(initialCameraPosition: _initialCameraPosition,
            mapType: MapType.normal,
            markers: myMarker,
            polylines: _myPolyline,
            onMapCreated: (GoogleMapController controller)
            {
              _controller.complete(controller);
            }
        ),
      ),
    );
  }
}
