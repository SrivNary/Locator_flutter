import 'package:flutter/material.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({super.key});

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
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
          title: const Text('Invite Friend'),
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
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 30, bottom: 380, right: 20, left: 20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    child: Container(
                      color: Colors.white70,
                      child: ListView(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: Image.asset(
                                        'assets/images/invite.png')),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: const Text(
                              'Invite Contact Friend',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            child: const Text(
                              'Invite your friends from your ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: const Text(
                              'contact list to earn more credits!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade800,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                              ),
                              height: 60,
                              child: const Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  // onTap: (){Navigator.pushReplacementNamed(context, '/home');},
                                  child: Text("INVITE NOW",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              )),
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
