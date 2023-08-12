//* @aprekt.dev
//* Complete code on github
//* link in bio

import 'package:flutter/material.dart';
import 'package:flutter_login_template_1/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
            headline1: TextStyle(
          color: Colors.blueGrey,
          fontSize: 40,
          fontWeight: FontWeight.w500,
        )),
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 250, child: TextField()),
            const SizedBox(width: 250, child: TextField()),
            ElevatedButton(onPressed: () {}, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
