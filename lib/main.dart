import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:num_navigation/Home/screen_page.dart';
import 'package:num_navigation/Home/setting_screen.dart';
import 'package:num_navigation/Location/google_map_theme.dart';
import 'package:num_navigation/Location/location_screen.dart';
import 'package:num_navigation/Location/my_polygone.dart';
import 'package:num_navigation/Location/my_polyline.dart';
import 'package:num_navigation/Menu/about.dart';
import 'package:num_navigation/Menu/invite_friend.dart';
import 'package:num_navigation/Menu/policy_page.dart';
import 'package:num_navigation/Test/app_info.dart';
import 'package:num_navigation/Test/map_screen.dart';
import 'package:num_navigation/Test/signin.dart';
import 'package:num_navigation/User/login_page.dart';
import 'package:num_navigation/User/register_page.dart';
import 'package:num_navigation/User/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'Location/places_api_google.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid)
  {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3ZnLgjOlQH7j0O1ZterRILq0kqduBPdQ",
          authDomain: "numnivagation.firebaseapp.com",
          projectId: "numnivagation",
          storageBucket: "numnivagation.appspot.com",
          messagingSenderId: "770460880080",
          appId: "1:770460880080:web:8de21607b82d4bf70462d5",
          measurementId: "G-WKV5MMW98D"
      )
    );
  }
  else
  {
    await Firebase.initializeApp();
  }
  await Permission.locationWhenInUse.isDenied.then((value)
  {
    if(value)
    {
      Permission.locationWhenInUse.request();
    }
  });
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AppInfo(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          // '/': (context) => const SplashScreen(),
          // '/login': (context) => const LoginPage(),
          // '/register': (context) => const RegisterPage(),
          // '/home': (context) => const ScreenPage(),
        },
        home: LocationScreen(),
      ),
    );
  }
}

