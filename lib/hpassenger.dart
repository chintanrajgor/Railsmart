import 'package:flutter/material.dart';

// //--------------------------------------------Home for Passanger--------------------------------------
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     void _onItemTapped(int val) {
//       if (val == 1) {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => const MyProfile(
//                   title: 'RailSmart',
//                 )));
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(color: Colors.white),
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         color: Colors.grey[200],
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             color: Colors.grey[300],
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.grey,
//                 blurRadius: 2.0,
//                 spreadRadius: 0.0,
//                 offset: Offset(2.0, 2.0), // shadow direction: bottom right
//               )
//             ],
//           ),
//           margin: EdgeInsets.all(30.0),
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               FlatButton(
//                 padding: EdgeInsets.all(15),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const Bookbus(title: 'RailSmart')));
//                 },
//                 child: Text(
//                   "Book Bus Validity",
//                   style: TextStyle(color: Colors.deepOrange),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   side: BorderSide(color: Colors.deepOrangeAccent),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               FlatButton(
//                 padding: EdgeInsets.all(15),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const Booktrain(
//                             title: 'RailSmart',
//                           )));
//                 },
//                 child: Text(
//                   "Book Train Validity",
//                   style: TextStyle(color: Colors.deepOrange),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   side: BorderSide(color: Colors.deepOrangeAccent),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.deepOrange,
//         currentIndex: 0,
//       ),
//       endDrawer: const Drawer(
//         child: Text(
//           "Welcome to Drawer",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontStyle: FontStyle.italic,
//               color: Colors.white,
//               fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Color(0xFFFF6E40),
//       ),
//     );
//   }
// }
