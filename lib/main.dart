import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:up_image/style.dart';
import 'package:up_image/disable_page_transition.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
//Define Screen Size

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: const MainForm(),
      appBar: AppBar(
          shadowColor: Colors.white60,
          elevation: 1.0,
          title: GestureDetector(
            child: const AutoSizeText(
              "UP IMAGE",
              style: blsemiBold,
              minFontSize: 7,
              maxFontSize: 30,
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            },
          )),
    );
  }
}

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 10 / 100,
        left: MediaQuery.of(context).size.width * 5 / 100,
        right: MediaQuery.of(context).size.width * 5 / 100,
      ),
      child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          )),
    );
  }
}
