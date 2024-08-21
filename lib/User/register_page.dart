// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum SingingCharacter { male, female }

class _RegisterPageState extends State<RegisterPage> {
  SingingCharacter? _character = SingingCharacter.male;

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
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Image.asset("assets/images/logo.png", width: 140, height: 140,),
          const SizedBox(height: 10,),
          const Text("សាកលវិទ្យាល័យ ជាតិគ្រប់គ្រង", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
          const Text("National University of Management", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
          const SizedBox(height: 10,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                child: Container(
                  color: Colors.white70,
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: const Text('Register', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54,),),
                          ),
                          Positioned(left: 0, top: 0, bottom: 0,
                            child: IconButton(
                              icon: const Icon(Icons.chevron_left, size: 35,),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text("First Name", style: TextStyle(color: Colors.grey),),
                                      SizedBox(width: 5,),
                                      Text("*", style: TextStyle(color: Colors.red),),
                                    ],
                                  )),
                            ),
                            const Positioned(right: 0, top: 25, child: Icon(Icons.person, size: 25, color: Colors.grey,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text("Last Name", style: TextStyle(color: Colors.grey),),
                                      SizedBox(width: 5,),
                                      Text("*", style: TextStyle(color: Colors.red),),
                                    ],
                                  )),
                            ),
                            const Positioned(right: 0, top: 25,
                              child: Icon(Icons.person, size: 25, color: Colors.grey,),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('Male', style: TextStyle(fontSize: 17),),
                                leading: Radio<SingingCharacter>(
                                  value: SingingCharacter.male,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('Female', style: TextStyle(fontSize: 17),),
                                leading: Radio<SingingCharacter>(
                                  value: SingingCharacter.female,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text("Phone Number", style: TextStyle(color: Colors.grey),),
                                      SizedBox(width: 5,),
                                      Text("*", style: TextStyle(color: Colors.red),),
                                    ],
                                  )),
                            ),
                            const Positioned(right: 0, top: 25,
                              child: Icon(Icons.phone_android_rounded, size: 25, color: Colors.grey,),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text("Password", style: TextStyle(color: Colors.grey),),
                                      SizedBox(width: 5,),
                                      Text("*", style: TextStyle(color: Colors.red),),
                                    ],
                                  )),
                            ),
                            const Positioned(right: 0, top: 25,
                              child: Icon(Icons.lock, size: 25, color: Colors.grey,),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text("Confirm Password", style: TextStyle(color: Colors.grey),),
                                      SizedBox(width: 5,),
                                      Text("*", style: TextStyle(color: Colors.red),),
                                    ],
                                  )),
                            ),
                            const Positioned(right: 0, top: 25,
                              child: Icon(Icons.lock, size: 25, color: Colors.grey,),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Please accept with ", style: TextStyle(color: Colors.grey, fontSize: 15),),
                            SizedBox(width: 5,),
                            InkWell(
                              child: Text("Term & Condition", style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,),),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                          ),
                          height: 60,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              },
                              child: const Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
