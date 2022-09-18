import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:railsmart/fourth.dart';
import 'package:railsmart/second.dart';
import 'package:railsmart/signup.dart';
import 'package:railsmart/third.dart';

import 'authentication_services.dart';
import 'main.dart';
import './profile.dart';

//--------------------------------------------Home for TC--------------------------------------
class MyHomeTC extends StatefulWidget {
  const MyHomeTC({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomeTC> createState() => _MyHomeTC();
}

class _MyHomeTC extends State<MyHomeTC> {
  String barcode = "";
  DateTime now = DateTime.now();
  late DateTime date;
  String currdatetime = '';
  late Position _currentPosition;
  String _currentAddress = "";
  @override
  initState() {
    super.initState();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final fire = FirebaseFirestore.instance;
  final _validRef = FirebaseFirestore.instance.collection('validities');
  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    final name = user?.displayName;
    final uid = user?.uid;
    void _onItemTapped(int val) {
      if (val == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyProfile(
              title: 'RailSmart',
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
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
              // Container(
              //   child: RaisedButton(
              //     onPressed: () {
              //       now = DateTime.now();
              //       date = DateTime(now.year, now.month, now.day);
              //       setState(
              //         () {
              //           currdatetime = "$now,$date";
              //         },
              //       );
              //     },
              //     child: Text(
              //       "Date",
              //       style: TextStyle(fontSize: 20, color: Colors.white),
              //     ),
              //     color: Colors.green,
              //   ),
              //   padding: const EdgeInsets.all(1.0),
              //   margin: EdgeInsets.all(10),
              // ),
              Container(
                child: RaisedButton(
                  onPressed: allscan,
                  child: Text(
                    "Capture Image",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.green,
                ),
                padding: const EdgeInsets.all(1.0),
                margin: EdgeInsets.all(10),
              ),

              Padding(
                padding: const EdgeInsets.all(1.0),
              ),
              Text(
                "Todays date",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                currdatetime,
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
              // RaisedButton

              Padding(
                padding: const EdgeInsets.all(1.0),
              ),
              Text(
                "Scanned Barcode Number",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                barcode,
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),

              // Container(
              //   child: RaisedButton(
              //     onPressed: _getCurrentLocation,
              //     child: Text(
              //       "Location",
              //       style: TextStyle(fontSize: 20, color: Colors.white),
              //     ),
              //     color: Colors.green,
              //   ),
              //   padding: const EdgeInsets.all(1.0),
              //   margin: EdgeInsets.all(10),
              // ),
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
        backgroundColor: Color(0xFFFF6E40),
      ),
    );
  }

  Future allscan() async {
    barcodeScanning();
    _getCurrentLocation();
    now = DateTime.now();
    date = DateTime(now.year, now.month, now.day);
    setState(() {
      this.currdatetime = "$now,$date";
    });
    if (barcode == "CU4EgNPJi1SizAftfNmPrCkjfNm1") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Second(
            title: 'RailSmart',
          ),
        ),
      );
    } else if (barcode == "R9S8RRzkhlfe66xaUm2Auwv3Zjr2") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Fourth(
            title: 'RailSmart',
          ),
        ),
      );
    } else if (barcode == "uEd9PzDaGoOmyYO8SUssM3SbYrE3") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Third(
            title: 'RailSmart',
          ),
        ),
      );
    }
  }

  //scan barcode asynchronously
  Future barcodeScanning() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode.rawContent);
      if (this.barcode == "CU4EgNPJi1SizAftfNmPrCkjfNm1") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Second(
              title: 'RailSmart',
            ),
          ),
        );
      } else if (this.barcode == "R9S8RRzkhlfe66xaUm2Auwv3Zjr2") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Third(
              title: 'RailSmart',
            ),
          ),
        );
      } else if (this.barcode == "uEd9PzDaGoOmyYO8SUssM3SbYrE3") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Fourth(
              title: 'RailSmart',
            ),
          ),
        );
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'No camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode = 'Nothing captured.');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  _getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.subLocality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
