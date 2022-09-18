import 'package:flutter/material.dart';

//----------------------------------Book Bus--------------------------------------
// class Bookbus extends StatefulWidget {
//   const Bookbus({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<Bookbus> createState() => _MyBookbusState();
// }

// class _MyBookbusState extends State<Bookbus> {
//   void _onItemTapped(int val) {
//     if (val == 1) {
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => const MyProfile(
//                 title: 'RailSmart',
//               )));
//     }
//   }

//   String? dropdownvalue1;
//   String? dropdownvalue2;
//   // List of items in our dropdown menu
//   var from = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//   var to = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];

//   @override
//   Widget build(BuildContext context) {
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
//               // Array list of items

//               // After selecting the desired option,it will
//               // change button value to selected value
//               DecoratedBox(
//                 decoration: BoxDecoration(
//                     color: Colors.deepOrange,
//                     //background color of dropdown button
//                     border: Border.all(
//                         color: Colors.black38,
//                         width: 2), //border of dropdown button
//                     borderRadius: BorderRadius.circular(
//                         10), //border raiuds of dropdown button
//                     boxShadow: <BoxShadow>[
//                       //apply shadow on Dropdown button
//                       BoxShadow(
//                           color:
//                               Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
//                           blurRadius: 1) //blur radius of shadow
//                     ]),
//                 child: Padding(
//                   padding: EdgeInsets.all(5),
//                   child: DropdownButton(
//                     underline: Container(),
//                     elevation: 2,
//                     icon: const Icon(
//                       Icons.arrow_circle_down_sharp,
//                       color: Colors.white,
//                     ),
//                     dropdownColor: Colors.grey,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                     alignment: AlignmentDirectional.center,
//                     // Array list of items
//                     items: from.map((String items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items),
//                       );
//                     }).toList(),

//                     hint: const Text(
//                       "From",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         dropdownvalue1 = newValue!;
//                       });
//                     },
//                     value: dropdownvalue1,
//                     isExpanded: true,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               DecoratedBox(
//                 decoration: BoxDecoration(
//                     color:
//                         Colors.deepOrange, //background color of dropdown button
//                     border: Border.all(
//                         color: Colors.black38,
//                         width: 2), //border of dropdown button
//                     borderRadius: BorderRadius.circular(
//                         10), //border raiuds of dropdown button
//                     boxShadow: <BoxShadow>[
//                       //apply shadow on Dropdown button
//                       BoxShadow(
//                           color:
//                               Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
//                           blurRadius: 1) //blur radius of shadow
//                     ]),
//                 child: Padding(
//                   padding: EdgeInsets.all(5),
//                   child: DropdownButton(
//                     underline: Container(),
//                     elevation: 2,
//                     icon: const Icon(
//                       Icons.arrow_circle_down_sharp,
//                       color: Colors.white,
//                     ),
//                     dropdownColor: Colors.grey,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                     alignment: AlignmentDirectional.center,
//                     // Array list of items
//                     items: to.map((String items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items),
//                       );
//                     }).toList(),

//                     hint: const Text(
//                       "To",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         dropdownvalue2 = newValue!;
//                       });
//                     },
//                     value: dropdownvalue2,
//                     isExpanded: true,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30.0,
//               ),

//               FlatButton(
//                 padding: EdgeInsets.all(15),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const MyProfile(
//                             title: 'RailSmart',
//                           )));
//                 },
//                 child: Text(
//                   "Book",
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
//         selectedItemColor: Colors.deepOrange,
//         currentIndex: 0,
//         onTap: _onItemTapped,
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
