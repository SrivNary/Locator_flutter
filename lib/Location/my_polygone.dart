import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyPolygone extends StatefulWidget {
  const MyPolygone({super.key});

  @override
  State<MyPolygone> createState() => _MyPolygoneState();
}

class _MyPolygoneState extends State<MyPolygone> {

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(11.575108446478543, 104.91858354975695), zoom: 18,
  );
  final Set<Polygon> _myPolygone = HashSet<Polygon>();
  List<LatLng> points = const [
    LatLng(11.57493969691999, 104.91791715149108),
    LatLng(11.574485111170162, 104.91800298217298),
    LatLng(11.574561313457211, 104.91854478835235),
    LatLng(11.574343217201024, 104.91858233927569),
    LatLng(11.574445696185952, 104.91920327061494),
    LatLng(11.575175624358963, 104.91911102389622),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myPolygone.add(
      Polygon(polygonId: const PolygonId('First'),
        points: points,
        fillColor: Colors.cyan.withOpacity(0.3),
        geodesic: true,
        strokeColor: Colors.redAccent,

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Polygone'),
      centerTitle: true,
      backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            mapType: MapType.normal,
            polygons: _myPolygone,
            onMapCreated: (GoogleMapController controller)
            {
              _controller.complete(controller);
            }
        ),
      ),
    );
  }
}
