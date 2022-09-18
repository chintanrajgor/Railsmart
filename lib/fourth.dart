import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:railsmart/signup.dart';
import 'authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './booktrain.dart';

//--------------------------------------------Profile--------------------------------------
class Fourth extends StatefulWidget {
  const Fourth({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Fourth> createState() => _Fourth();
}

class _Fourth extends State<Fourth> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fire = FirebaseFirestore.instance;
  final _validRef = FirebaseFirestore.instance.collection('validities');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
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
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              Text("USERNAME:kashyap kurani"),
              SizedBox(
                height: 30,
              ),
              Text("Validities:"),
              SizedBox(
                height: 30,
              ),
              Text("From:Vashi"),
              SizedBox(
                height: 30,
              ),
              Text("To:Govandi"),
              SizedBox(
                height: 30,
              ),
              Text("Valid Till: 08/05/2022"),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Text(
              "Welcome to Drawer",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text("HOME"),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ), // RaisedButton
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
