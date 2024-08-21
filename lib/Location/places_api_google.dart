import 'package:flutter/material.dart';

class PlacesApiGoogleMapSearch extends StatefulWidget {
  const PlacesApiGoogleMapSearch({super.key});

  @override
  State<PlacesApiGoogleMapSearch> createState() => _PlacesApiGoogleMapSearchState();
}

class _PlacesApiGoogleMapSearchState extends State<PlacesApiGoogleMapSearch> {

  String tokenForSession = '37465';
  final TextEditingController _controller = TextEditingController();
  void makeSuggestion(String input) async
  {
    String googlePlacesApiKey = 'AIzaSyDdtDxaSvW5ljDG15i6edlEjPqB4bOZyRw';
    String groundURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    // String request = '$groundURL?input=$input&';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.orange, Colors.teal],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Places Api Google Map Search'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.teal, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Search here'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
