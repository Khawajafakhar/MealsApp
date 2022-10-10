

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Recipe App',
       theme: ThemeData(
        primaryColor: Colors.blue,
       ),
       home: MyHomePage(),

    );
      
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe App')),
      body: Container(alignment: Alignment.center,
      child: Text('Navigation Time!')),
    );
      
    
  }
}