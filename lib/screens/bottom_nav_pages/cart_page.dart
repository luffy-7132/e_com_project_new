// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Skeletonizer Demo')),
      body: Skeletonizer(
        enabled: _enabled,
        child: ListView.builder(
          itemCount: 6,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Item number $index as title'),
                subtitle: const Text('Subtitle here'),
                trailing: const Icon(
                  Icons.ac_unit,
                  size: 32,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Skeletonizer Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(useMaterial3: true),
//       home: const SkeletonizerDemoPage(),
//     );
//   }
// }
//
// class SkeletonizerDemoPage extends StatefulWidget {
//   const SkeletonizerDemoPage({super.key});
//
//   @override
//   State<SkeletonizerDemoPage> createState() => _SkeletonizerDemoPageState();
// }
//
// class _SkeletonizerDemoPageState extends State<SkeletonizerDemoPage> {
bool _enabled = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
