// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
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
          title: const Text('Policy'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent, // Customize the app bar color
          foregroundColor: Colors.white,
          elevation: 0, // Remove shadow
          toolbarHeight: 70,
        ),
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
            // padding: const EdgeInsets.only(top: 50),
            child: Column(children: [
              const SizedBox(
                height: 0,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 0, left: 0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                    child: Container(
                      color: Colors.white70,
                      child: ListView(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: 500,
                                  child: const Text(
                                    'Key mission which is to improve and apply the best quality standards in '
                                    'Education research, and innovation. The strategic plan 2019-2023 expresses the university '
                                    'strong commitment to transform the National University of Management to be the leading '
                                    'research university in entrepreneurship and innovation.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade800,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                            ),
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
