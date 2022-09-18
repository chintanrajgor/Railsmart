import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:railsmart/booktrain.dart';
import 'authentication_services.dart';

import './main.dart';
import 'signup.dart';
import './hometc.dart';
import 'ggsignin.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title, required this.username})
      : super(key: key);
  final String title;
  final String username;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  var tc = [
    "kashyap@railsmart.com",
    "chintan@railsmart.com",
    "jay@railsmart.com",
    "annanya@railsmart.com",
    "tc@railsmart.com"
  ];
  var tcp = ['123456', '12345678'];
  final myuser = TextEditingController();
  final mypass = TextEditingController();
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
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
              TextField(
                decoration: InputDecoration(hintText: "TC User Name"),
                controller: myuser,
              ), // TextField
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(hintText: "TC Password"),
                controller: mypass,
              ),

              //login
              SizedBox(
                height: 30,
              ),
              FlatButton(
                padding: EdgeInsets.all(15),
                color: Colors.black,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.blue),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.blue),
                ),
                onPressed: () {
                  if (tc.contains(myuser.text) && tcp.contains(mypass.text)) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyHomeTC(
                          title: 'RailSmart',
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the

                          // TextEditingController.

                          content: Text("Invalid Credentials"),
                        );
                      },
                    );
                  }
                },
              ),

              //signup
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
