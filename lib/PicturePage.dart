import 'package:flutter/material.dart';

class PicturePage extends StatefulWidget{

  @override
  State createState() => new PicturePageState();
}

class PicturePageState extends State<PicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: const Text('Happy Image!'),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: Center(
        child: Text("Pictures go here"),
      ),
    );
  }
}