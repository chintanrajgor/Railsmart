import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:railsmart/booktrain.dart';
import 'package:railsmart/login.dart';
import 'authentication_services.dart';

import './main.dart';
import 'signup.dart';
import './hometc.dart';
import 'ggsignin.dart';

class First extends StatefulWidget {
  const First({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  final fire = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> getCurrentUser() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid.toString();
  }

  Future<String> getDisplayName() async {
    final user = auth.currentUser;
    var name = user?.displayName;
    return name.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.grey[200],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                padding: EdgeInsets.all(15),
                color: Colors.black,
                child: Text(
                  "TC LOGIN",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Login(
                        title: 'RailSmart',
                        username: '',
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.blue),
                ),
              ),

              //signup
              SizedBox(
                height: 20,
              ),
              FlatButton(
                padding: EdgeInsets.all(15),
                color: Colors.black,
                child: Text(
                  "USER",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () async {
                  await FirebaseService().signInwithGoogle();
                  print('Current User');
                  final ust = await getCurrentUser();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Booktrain(
                        title: 'RailSmart',
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
