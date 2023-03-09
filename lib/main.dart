import 'package:flutter/material.dart';

import 'package:up_image/disable_page_transition.dart';

import 'package:up_image/upload_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'UPLOAD IMAGE',
      theme: ThemeData(
        pageTransitionsTheme: NoTransitionsOnWeb(),
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "OpenSans",
        useMaterial3: true,
        applyElevationOverlayColor: true,
      ),
      home: const UploadPage(),
    );
  }
}
