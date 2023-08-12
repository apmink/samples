//* @apmink.dev
//* Complete code on github
//* link in bio

import 'package:flutter/material.dart';
import 'package:template_modal_bottom_sheet_1/screens/modal_bottom_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff005b7f),
        ),
      ),
      home: const ModalBottomSheet(),
    );
  }
}


