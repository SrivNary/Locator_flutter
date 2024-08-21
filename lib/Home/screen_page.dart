// import 'package:flutter/material.dart';
// // import 'package:navigation_num/Home/home_screen.dart';
// // import 'package:navigation_num/Home/location_screen.dart';
// // import 'package:navigation_num/Home/setting_screen.dart';
// // import 'package:navigation_num/Menu/about.dart';
// // import 'package:navigation_num/Menu/invite_friend.dart';
// // import 'package:navigation_num/Menu/policy_page.dart';
// // import 'package:navigation_num/User/login_page.dart';
// import 'package:num_navigation/Home/home_screen.dart';
// import 'package:num_navigation/Home/setting_screen.dart';
// import 'package:num_navigation/Location/location_screen.dart';
// import 'package:num_navigation/Menu/about.dart';
// import 'package:num_navigation/Menu/invite_friend.dart';
// import 'package:num_navigation/Menu/policy_page.dart';
// import 'package:num_navigation/Test/signin.dart';
//
// class ScreenPage extends StatefulWidget {
//   const ScreenPage({super.key});
//
//   @override
//   State<ScreenPage> createState() => _ScreenPageState();
// }
//
// class _ScreenPageState extends State<ScreenPage> {
//   int currentPageIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     final ThemeData theme = Theme.of(context);
//     // ignore: no_leading_underscores_for_local_identifiers
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text('សាកលវិទ្យាល័យ ជាតិគ្រប់គ្រង'),
//           centerTitle: true,
//           backgroundColor: Colors.blueAccent, // Customize the app bar color
//           foregroundColor: Colors.white,
//           elevation: 0, // Remove shadow
//           toolbarHeight: 70,
//           leading: IconButton(
//             icon: const Icon(Icons.menu), // Add your leading icon here
//             onPressed: () {
//               _scaffoldKey.currentState?.openDrawer();
//             },
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.notifications_active_outlined),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               Container(
//                 height: 130,
//                 decoration: const BoxDecoration(color: Colors.blue,),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 25),
//                     child: Image.asset("assets/images/logo.png", width: 90,),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
//                 color: Colors.yellow,
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text("NUM Flutter", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
//                       ],
//                     ),
//                     SizedBox(height: 5,),
//                     Row(
//                       children: [
//                         Text("View Profile", style: TextStyle(color: Colors.blue),),
//                         Icon(Icons.chevron_right_rounded, size: 30, color: Colors.blue,),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 300,
//                 padding: const EdgeInsets.all(20),
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentPageIndex = 0;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.home_outlined, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("Home", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => const InviteFriend()));
//                         setState(() {
//                           currentPageIndex = 0;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.supervisor_account_outlined, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("Invite Friend", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationScreen()));
//                         setState(() {
//                           currentPageIndex = 2;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.location_on_rounded, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("Locator", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
//                         setState(() {
//                           currentPageIndex = 0;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.playlist_add_check_circle_outlined, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("About", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => const PolicyPage()));
//                         setState(() {
//                           currentPageIndex = 0;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.privacy_tip_outlined, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("Policy", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
//                         setState(() {
//                           currentPageIndex = 2;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.settings_outlined, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("Setting", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin()));
//                         setState(() {
//                           currentPageIndex = 0;
//                         });
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.output, color: Colors.blue,),
//                           SizedBox(width: 20,),
//                           Text("Logout", style: TextStyle(color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.blue,
//               Colors.white,
//             ],
//           )),
//           padding: const EdgeInsets.only(top: 30),
//           child: const HomeScreen(),
//         ),
//
//         // Block ButtomNavigatorBar------------->>>>
//         bottomNavigationBar: NavigationBar(
//           onDestinationSelected: (int index) {
//             setState(() {
//               currentPageIndex = index;
//               if (currentPageIndex == 2) {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
//               } else if (currentPageIndex == 1) {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationScreen()));
//               }
//             });
//           },
//           indicatorColor: Colors.amber,
//           selectedIndex: currentPageIndex,
//           backgroundColor: Colors.white70,
//           destinations: const <Widget>[
//             NavigationDestination(
//               selectedIcon: Icon(Icons.home_outlined, color: Colors.blue, size: 35,),
//               icon: Icon(Icons.home_outlined, color: Colors.blue, size: 35,),
//               label: '',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.map_outlined, color: Colors.blue, size: 35,),
//               label: '',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.settings_outlined, color: Colors.blue, size: 35,),
//               label: '',
//             ),
//           ],
//         ));
//   }
// }
