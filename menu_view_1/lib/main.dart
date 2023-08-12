//* @aprekt.dev
//* Complete code on github
//* link in bio

import 'package:flutter/material.dart';
import 'package:flutter_layout_template_1/constants/strings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListView = true;

  Widget switchView() {
    if (isListView) {
      return ListView.builder(itemBuilder: ((context, index) {
        return ListTile(
          title: Text("Item #${index + 1}"),
        );
      }));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        // mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) {
        return GridTile(child: Center(child: Text("Item #${index + 1}")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isListView = true;
              });
            },
            icon: const Icon(Icons.view_list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isListView = false;
              });
            },
            icon: const Icon(Icons.view_module),
          ),
        ],
      ),
      body: switchView(),
    );
  }
}
