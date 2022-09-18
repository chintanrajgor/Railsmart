import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './main.dart';
import './profile.dart';
import 'first.dart';
import 'authentication_services.dart';

//----------------------------------Book Train--------------------------------------
class Booktrain extends StatefulWidget {
  const Booktrain({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Booktrain> createState() => _MyBooktrainState();
}

class _MyBooktrainState extends State<Booktrain> {
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

  String? dropdownvalue1;
  String? dropdownvalue2;
  String? dropdownvalue3;
  String? dropdownvalue4;
  String? dropdownvalue5;
  // List of items in our
  // dropdown menu
  var from = [
    'Central',
    'Western',
    'Harbour',
  ];
  List<String> selected = [];
  List<String> selected2 = [];
  var Harbour = [
    'MUMBAI C.S.T.',
    'Masjid',
    'Sandhurst Rd',
    'Dockyard Rd',
    'Reay Rd',
    'Cotton Green',
    'Sewri',
    'Wadala Rd',
    'GTB Nagar',
    'Chunabhatti',
    'KURLA',
    'Tilak Nagar',
    'Chembur',
    'Govandi',
    'MANKHURD',
    'VASHI',
    'Sanpada',
    'Jui Nagar',
    'Nerul',
    'Seawood',
    'BELAPUR',
    'Kharghar',
    'Khandeshwar',
    'King Circle',
    'Mahim Jn',
    'BANDRA',
    'Khar Rd',
    'Santacruz',
    'Vile Parle',
    'ANDHERI'
  ];
  var Western = [
    'CHURCHGATE',
    'Marine Lines',
    'Charni Rd',
    'Grant Rd',
    'MUMBAI CENTRAL',
    'Mahalaxmi',
    'Lower Parel',
    'Elphinston Rd',
    'DADAR',
    'Matunga Rd',
    'Mahim Jn',
    'BANDRA',
    'Khar Rd',
    'Santacruz',
    'Vile Parle',
    'ANDHERI',
    'Jogeshwari',
    'Goregaon',
    'Malad',
    'Kandivali',
    'BORIVALI',
    'Dahisar',
    'Mira Rd',
    'BHAYANDER',
    'Naigaon',
    'VASAI RD',
    'Nallasopara',
    'VIRAR',
    'Valtarna',
    'Saphale',
    'Kelva Rd',
    'Palghar',
    'Umroli',
    'Bolsar',
    'Vangaon',
    'DAHANU RD',
  ];
  var sinret = ['Single', 'Return'];
  var Central = [
    'MUMBAI C.S.T.',
    'Masjid',
    'Sandhurst Rd',
    'BYCULLA',
    'Chinchpokli',
    'Currey Rd',
    'Parel',
    'DADAR',
    'Matunga',
    'Slon',
    'KURLA',
    'Vidyavihar',
    'GHATKOPAR',
    'Vikhroli',
    'Kanjurmarg',
    'Bhandup',
    'Nahur',
    'Mulund',
    'THANE',
    'Kalwa',
    'Mumbra',
    'Diva',
    'Lower Kopar (P)',
    'DOMBIVLI',
    'Thakurli',
    'Kalyan'
  ];

  final fire = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future getCurrentUser() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid.toString();
  }

  print(getCurrentUser()) {
    // TODO: implement print
    throw UnimplementedError();
  }

  Widget build(BuildContext context) {
    final _validRef = FirebaseFirestore.instance.collection('validities');
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          //background color of dropdown button
                          border: Border.all(
                              color: Colors.black38,
                              width: 2), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              10), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.1), //shadow for button
                                blurRadius: 1) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(0.5),
                        child: DropdownButton(
                          underline: Container(),
                          elevation: 2,
                          icon: const Icon(
                            Icons.arrow_circle_down_sharp,
                            color: Colors.white,
                          ),
                          dropdownColor: Colors.grey,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          alignment: AlignmentDirectional.center,
                          // Array list of items
                          items: from.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          hint: const Text(
                            "Choose Line",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            if (newValue == 'Central') {
                              selected = Central;
                            } else if (newValue == 'Western') {
                              selected = Western;
                            } else if (newValue == 'Harbour') {
                              selected = Harbour;
                            } else {
                              selected = [];
                            }
                            setState(() {
                              dropdownvalue2 = null;
                              dropdownvalue1 = newValue!;
                            });
                          },
                          value: dropdownvalue1,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          //background color of dropdown button
                          border: Border.all(
                              color: Colors.black38,
                              width: 2), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              10), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.1), //shadow for button
                                blurRadius: 1) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: DropdownButton(
                          underline: Container(),
                          elevation: 2,
                          icon: const Icon(
                            Icons.arrow_circle_down_sharp,
                            color: Colors.white,
                          ),
                          dropdownColor: Colors.grey,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          alignment: AlignmentDirectional.center,
                          // Array list of items
                          items: selected.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          hint: const Text(
                            "From",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue2 = newValue!;
                            });
                          },
                          value: dropdownvalue2,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Array list of items

              // After selecting the desired option,it will
              // change button value to selected value

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          //background color of dropdown button
                          border: Border.all(
                              color: Colors.black38,
                              width: 2), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              10), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.1), //shadow for button
                                blurRadius: 1) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: DropdownButton(
                          underline: Container(),
                          elevation: 2,
                          icon: const Icon(
                            Icons.arrow_circle_down_sharp,
                            color: Colors.white,
                          ),
                          dropdownColor: Colors.grey,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          alignment: AlignmentDirectional.center,
                          // Array list of items
                          items: from.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          hint: const Text(
                            "Choose line",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            if (newValue == 'Central') {
                              selected2 = Central;
                            } else if (newValue == 'Western') {
                              selected2 = Western;
                            } else if (newValue == 'Harbour') {
                              selected2 = Harbour;
                            } else {
                              selected2 = [];
                            }
                            setState(() {
                              dropdownvalue4 = null;
                              dropdownvalue3 = newValue!;
                            });
                          },
                          value: dropdownvalue3,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          //background color of dropdown button
                          border: Border.all(
                              color: Colors.black38,
                              width: 2), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              10), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.1), //shadow for button
                                blurRadius: 1) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: DropdownButton(
                          underline: Container(),
                          elevation: 2,
                          icon: const Icon(
                            Icons.arrow_circle_down_sharp,
                            color: Colors.white,
                          ),
                          dropdownColor: Colors.grey,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          alignment: AlignmentDirectional.center,
                          // Array list of items
                          items: selected2.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          hint: const Text(
                            "To",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue4 = newValue!;
                            });
                          },
                          value: dropdownvalue4,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 5.0,
              ),

              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                padding: EdgeInsets.all(15),
                color: Colors.black,
                onPressed: () {
                  _validRef.doc(user?.uid.toString()).set(
                    {
                      'To': dropdownvalue4,
                      'From': dropdownvalue2,
                      'Till': DateTime.now().day.toString() +
                          "/" +
                          DateTime.now().month.toString()
                    },
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyProfile(
                        title: 'RailSmart',
                      ),
                    ),
                  );
                },
                child: Text(
                  "Book",
                  style: TextStyle(color: Colors.amber),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.amber,
        currentIndex: 0,
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

// class UserModel_validities{
//   UserModel_validities({
//     required this.from,
//     required this.till,
//     required this.to,
//   });
 
//   String from; 
//   String till;
//   int to;
//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'from': from,
//         'till': till,
//         'to': to,
//       };
 
//   factory UserModel_validities.fromJson(Map<String, dynamic> json) => UserModel_validities(
//     from: json['from'] as String,
//     till: json['till'] as String,
//     to: json['to'] as int,
//   );
// }
// Future<UserModel_validities> insertFirestore(UserModel_validities model) async {
//   try {
//     final document = await FirebaseFirestore.instance
//         .collection(UserModel_validities.fromJson())
//         .add(model.toJson());
//     model. = document;
//     return model;
//   } catch (e) {
//     rethrow;
//   }
// }