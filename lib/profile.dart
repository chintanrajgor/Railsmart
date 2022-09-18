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
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fire = FirebaseFirestore.instance;
  final _validRef = FirebaseFirestore.instance.collection('validities');
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int val) {
      if (val == 1) {
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Booktrain(
                  title: 'RailSmart',
                )));
      }
    }

    final user = auth.currentUser;
    final name = user?.displayName;
    final uid = user!.uid;
    final validDoc = _validRef.doc(uid);
    const source = Source.cache;
    String travel = '';
    getvalidities() async {
      validDoc.get().then((value) {
        setState(() {
          travel = value.data() as String;
        });
      });
    }

    print(getvalidities());
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImage(
                    data: uid,
                    version: QrVersions.auto,
                    size: 200,
                    gapless: false,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Name:' + name.toString(), textAlign: TextAlign.left),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        onTap: _onItemTapped,
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
