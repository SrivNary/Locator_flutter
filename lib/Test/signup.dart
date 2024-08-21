import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:num_navigation/Home/home_screen.dart';
import 'package:num_navigation/Test/global.dart';
import 'package:num_navigation/Test/map_screen.dart';
import 'package:num_navigation/Test/signin.dart';
import 'package:num_navigation/widgets/loading_dialog.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController userNametextEditingController = TextEditingController();
  TextEditingController userPhonetextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  validateSignUpForm()
  {
    if(userNametextEditingController.text.trim().length < 3)
    {
        associateMethods.showSnackBarMsg("name must be at least 3 or more characters", context);
    }
    else if(userPhonetextEditingController.text.trim().length < 7)
    {
      associateMethods.showSnackBarMsg("phone number must 7 or more numbers", context);
    }
    else if(!emailtextEditingController.text.contains("@"))
    {
      associateMethods.showSnackBarMsg("email is not valid", context);
    }
    else if(passwordtextEditingController.text.trim().length < 5)
    {
      associateMethods.showSnackBarMsg("password must be at least 5 or more characters", context);
    }
    else
    {
      signUserNow();
    }
  }

  signUserNow() async
  {
    showDialog(
        context: context,
        builder: (BuildContext context) => LoadingDialog(messageTxt: "please wait...")
    );
    try
    {
      final User? firebaseUser = (
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailtextEditingController.text.trim(),
          password: passwordtextEditingController.text.trim()
        ).catchError((onError)
        {
          Navigator.pop(context);
          associateMethods.showSnackBarMsg(onError.toString(), context);
        })
      ).user;
      Map userDataMap =
      {
        "name": userNametextEditingController.text.trim(),
        "email": emailtextEditingController.text.trim(),
        "phone": userPhonetextEditingController.text.trim(),
        "id": firebaseUser!.uid,
        "blockStatus": "no",
      };
      FirebaseDatabase.instance.ref().child("users").child(firebaseUser!.uid).set(userDataMap);
      Navigator.pop(context);
      associateMethods.showSnackBarMsg("account created successfully.", context);
      Navigator.push(context, MaterialPageRoute(builder: (c)=> const MapScreen()));
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
              const Text("Register New Account",
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
                      controller: userNametextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22,),
                    TextField(
                      controller: userPhonetextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Phone",
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22,),
                    TextField(
                      controller: emailtextEditingController,
                      keyboardType: TextInputType.text,
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
                        validateSignUpForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      ),
                      child: const Text("SignUp", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));
                },
                child: const Text("Already have an Account? Login here",style: TextStyle(color: Colors.grey),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
