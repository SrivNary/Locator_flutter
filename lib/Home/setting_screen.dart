import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _selectedLanguage = 'English';
  bool app = false;

  final List _langauge = [
    'English',
    'Khmer',
  ];

  // bool _app = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b53bc),
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
        title: const Text('Setting'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Customize the app bar color
        foregroundColor: Colors.white,
        elevation: 0, // Remove shadow
        toolbarHeight: 70,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xffcfd3d7),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xffc8c8c8),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  'GENERAL',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // --------------->
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // color: const Color(0xffc8c8c8),
              decoration: const BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Launguge --------------------->>

                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    child: Text(
                      'Change Lauguage',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    width: double.infinity,
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffc8c8c8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            // top: 5,
                          ),

                          // Block Click Show Launge
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                app = !app;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedLanguage,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  app
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                )
                              ],
                            ),
                          ),
                        ),
                        app
                            ? const SizedBox(
                                height: 10,
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                        for (int i = 0; i < _langauge.length; i++)
                          app
                              ? TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedLanguage = _langauge[i];
                                      app = !app;
                                    });
                                  },
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      '${_langauge[i]}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  width: 0,
                                ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
