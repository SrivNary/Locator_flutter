// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          Image.asset(
            "assets/images/logo.png",
            width: 140,
            height: 140,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "សាកលវិទ្យាល័យ ជាតិគ្រប់គ្រង",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const Text(
            "National University of Management",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                child: Container(
                  color: Colors.white70,
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      SizedBox(
                        child: Stack(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text(
                                        "Username",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "*",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )),
                            ),
                            const Positioned(
                              right: 5,
                              top: 25,
                              child: Icon(
                                Icons.person,
                                size: 25,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Stack(
                          children: [
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  label: Row(
                                    children: [
                                      Text(
                                        "Password",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "*",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )),
                            ),
                            const Positioned(
                              right: 5,
                              top: 25,
                              child: Icon(
                                Icons.lock,
                                size: 25,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forget password?",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                          ),
                          height: 60,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Don't have account yet?",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "/register");
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
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
