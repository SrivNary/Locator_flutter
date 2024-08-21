import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapTheme extends StatefulWidget {
  const GoogleMapTheme({super.key});

  @override
  State<GoogleMapTheme> createState() => _GoogleMapThemeState();
}

class _GoogleMapThemeState extends State<GoogleMapTheme> {

  String themeForMap = '';

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(11.575108446478543, 104.91858354975695), zoom: 20,
  );
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context).loadString('i_theme/standard_theme.json').then((value)
    {
      themeForMap = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Style Google Map'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
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
        child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller)
            {
              controller.setMapStyle(themeForMap);
              _controller.complete(controller);
            }
        ),
      ),
    );
  }
}

