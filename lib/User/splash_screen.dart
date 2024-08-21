// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.white,
                  ],
                )),
            padding: const EdgeInsets.only(top: 90),
            child: SizedBox(
              width: double.infinity,
              child: Column(children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 140,
                  height: 140,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "សាកលវិទ្យាល័យ ជាតិគ្រប់គ្រង",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueAccent),
                ),
                const Text(
                  "National University of Management",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blueAccent),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "មហាវិទ្យាល័យ ពត៌មានវិទ្យា",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueAccent),
                ),
                const Text(
                  "Faculty of Information Technology",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blueAccent),
                ),
              ]),
            ),
          ),
        ));
  }
}
