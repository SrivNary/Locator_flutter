import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:num_navigation/Home/home_screen.dart';
import 'package:num_navigation/Test/global.dart';
import 'package:num_navigation/Test/map_screen.dart';
import 'package:num_navigation/Test/signup.dart';

import '../widgets/loading_dialog.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  validatesignInForm()
  {
    if(!emailtextEditingController.text.contains("@"))
    {
      associateMethods.showSnackBarMsg("email is not valid", context);
    }
    else if(passwordtextEditingController.text.trim().length < 5)
    {
      associateMethods.showSnackBarMsg("password must be at least 5 or more characters", context);
    }
    else
    {
      signInUserNow();
    }
  }
  signInUserNow() async
  {
    showDialog(
        context: context,
        builder: (BuildContext context) => LoadingDialog(messageTxt: "please wait...")
    );
    try
    {
      final User? firebaseUser = (
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailtextEditingController.text.trim(),
              password: passwordtextEditingController.text.trim()
          ).catchError((onError)
          {
            Navigator.pop(context);
            associateMethods.showSnackBarMsg(onError.toString(), context);
          })
      ).user;
      if(firebaseUser != null)
      {
        DatabaseReference ref = FirebaseDatabase.instance.ref().child("users").child(firebaseUser.uid);
        await ref.once().then((dataSnapshot)
        {
          if(dataSnapshot.snapshot.value != null)
          {
            if((dataSnapshot.snapshot.value as Map)["blockStatus"] == "no")
            {
              userName = (dataSnapshot.snapshot.value as Map)["name"];
              userPhone = (dataSnapshot.snapshot.value as Map)["phone"];
              Navigator.push(context, MaterialPageRoute(builder: (c)=> const MapScreen()));
              associateMethods.showSnackBarMsg("logged-in successfully.", context);
            }
            else
            {
              Navigator.pop(context);
              FirebaseAuth.instance.signOut();
              associateMethods.showSnackBarMsg("you are blocked. Contact admin: oeurndany1704@gmail.com", context);
            }
          }
          else
          {
            Navigator.pop(context);
            FirebaseAuth.instance.signOut();
            associateMethods.showSnackBarMsg("you record do not exists as a User", context);
          }
        });
      }
    }
    on FirebaseAuthException catch(e)
    {
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      associateMethods.showSnackBarMsg(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Image.asset('assets/images/logo.png', width: 130, height: 120,),
              const SizedBox(height: 120,),
              const Text("Login as User",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: emailtextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22,),
                    TextField(
                      controller: passwordtextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 32,),
                    ElevatedButton(
                      onPressed: ()
                      {
                        validatesignInForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      ),
                      child: const Text("Login", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              TextButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                  },
                child: const Text("Don't have an Account? SingUp here",style: TextStyle(color: Colors.grey),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
