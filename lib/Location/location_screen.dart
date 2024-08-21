import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String themeForMap = '';

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(11.575108446478543, 104.91858354975695), zoom: 18,
  );
  final Set<Polygon> _myPolygone = HashSet<Polygon>();
  List<LatLng> points = const [
    LatLng(11.574999466902643, 104.91791706869108),
    LatLng(11.5749440011171, 104.91786683088388),
    LatLng(11.574474479806113, 104.91793131050046),
    LatLng(11.57448958888248, 104.91804865714485),
    LatLng(11.574561849671227, 104.91854821857414),
    LatLng(11.574343096496975, 104.9185857695004),
    LatLng(11.574443604733293, 104.91920535978294),
    LatLng(11.57481804686967, 104.91915171560261),
    LatLng(11.574851549562002, 104.91916110333416),
    LatLng(11.575184605527049, 104.91910947081074),
  ];
  final List<Marker> myMarker = [];
  final List<Marker> myMarkerList = const [
    Marker(markerId: MarkerId('First'),
    position: LatLng(11.575108446478543, 104.91858354975695),
      infoWindow: InfoWindow(
        title: 'My NUM School'
      ),
    ),
    Marker(markerId: MarkerId('Second'),
      position: LatLng(11.574742207214285, 104.91863523811207),
      infoWindow: InfoWindow(
          title: 'អគារ A'
      ),
    ),
    Marker(markerId: MarkerId('First'),
      position: LatLng(11.574620338601207, 104.91912485733829),
      infoWindow: InfoWindow(
          title: 'អគារ B'
      ),
    ),
    Marker(markerId: MarkerId('First'),
      position: LatLng(11.574460971873235, 104.91887925029972),
      infoWindow: InfoWindow(
          title: 'អគារ C'
      ),
    ),
    Marker(markerId: MarkerId('First'),
      position: LatLng(11.57446253429258, 104.91861291019947),
      infoWindow: InfoWindow(
          title: 'អគារ D'
      ),
    ),
    Marker(markerId: MarkerId('First'),
      position: LatLng(11.574781267655945, 104.9180084617085),
      infoWindow: InfoWindow(
          title: 'អគារ E'
      ),
    ),
    Marker(markerId: MarkerId('First'),
      position: LatLng(11.575010942942667, 104.91904989934598),
      infoWindow: InfoWindow(
          title: 'អគារ F'
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myMarker.addAll(myMarkerList);
    _myPolygone.add(
        Polygon(polygonId: const PolygonId('First'),
          points: points,
          fillColor: Colors.cyan.withOpacity(0.1),
          geodesic: true,
          strokeColor: Colors.redAccent,

        )
    );
    DefaultAssetBundle.of(context).loadString('i_theme/standard_theme.json').then((value)
    {
      themeForMap = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        title: const Text('Locator'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Customize the app bar color
        foregroundColor: Colors.white,
        elevation: 0, // Remove shadow
        toolbarHeight: 70,
        actions: [
          PopupMenuButton(itemBuilder: (context) =>
          [
            PopupMenuItem(
              onTap:()
              {
                _controller.future.then((value)
                {
                  DefaultAssetBundle.of(context).loadString('i_theme/dark_theme.json').then((style)
                  {
                    value.setMapStyle(style);
                  });
                });
              },
              child: const Text('Dark'),
            ),
            PopupMenuItem(
              onTap:()
              {
                _controller.future.then((value)
                {
                  DefaultAssetBundle.of(context).loadString('i_theme/retro_theme.json').then((style)
                  {
                    value.setMapStyle(style);
                  });
                });
              },
              child: const Text('Retro'),
            ),
            PopupMenuItem(
              onTap:()
              {
                _controller.future.then((value)
                {
                  DefaultAssetBundle.of(context).loadString('i_theme/silver_theme.json').then((style)
                  {
                    value.setMapStyle(style);
                  });
                });
              },
              child: const Text('Silver'),
            ),
            PopupMenuItem(
              onTap:()
              {
                _controller.future.then((value)
                {
                  DefaultAssetBundle.of(context).loadString('i_theme/silver_theme.json').then((style)
                  {
                    value.setMapStyle(style);
                  });
                });
              },
              child: const Text('Standard'),
            ),
          ]
          ),
        ],
      ),
      body: SafeArea(
        child: GoogleMap(initialCameraPosition: _initialCameraPosition,
        mapType: MapType.normal,
        polygons: _myPolygone,
        markers: Set<Marker>.of(myMarker),
        onMapCreated: (GoogleMapController controller)
            {
              controller.setMapStyle(themeForMap);
              _controller.complete(controller);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.location_searching),
        onPressed: ()
        async
          {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
             const CameraPosition(target: LatLng(11.575108446478543, 104.91858354975695), zoom: 15,
              ),
            ));
            setState(() {

            });
          },
      ),
    );
  }
}

