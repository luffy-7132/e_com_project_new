// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(useMaterial3: false),
//       home: MyHomePage(title: 'Animated Navigation Bottom Bar'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   final autoSizeGroup = AutoSizeGroup();
//   var _bottomNavIndex = 0;
//   bool _showInitialPage = true;
//
//   final iconList = <IconData>[
//     Icons.brightness_5,
//     Icons.brightness_4,
//     Icons.brightness_6,
//     Icons.brightness_7,
//   ];
//
//   final List<Widget> _pages = [
//     AnotherPage(), // Display another page initially
//     SecondPage(),
//     ThirdPage(),
//     FourthPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[
//           _bottomNavIndex], // Show the current page based on _bottomNavIndex
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigate to the third page
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ThirdPage(),
//             ),
//           );
//         },
//         child: Icon(Icons.abc),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         icons: iconList,
//         activeIndex: _bottomNavIndex,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.smoothEdge,
//         onTap: (index) {
//           if (index == 0 && _showInitialPage) {
//             setState(() {
//               _showInitialPage = false;
//             });
//           } else {
//             setState(() {
//               _bottomNavIndex = index;
//             });
//           }
//         },
//       ),
//     );
//   }
// }
//
// // Example pages
// class AnotherPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Center(
//         child: Text('Another Page'),
//       ),
//     );
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       child: Center(
//         child: Text('Second Page'),
//       ),
//     );
//   }
// }
//
// class ThirdPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: Center(
//         child: Text('Third Page'),
//       ),
//     );
//   }
// }
//
// class FourthPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Center(
//         child: Text('Fourth Page'),
//       ),
//     );
//   }
// }
