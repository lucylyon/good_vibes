import 'package:flutter/material.dart';

class PicturePage extends StatefulWidget{

  @override
  State createState() => new PicturePageState();
}

class PicturePageState extends State<PicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture'),
      ),
      body: Center(
        child: Text("Pictures go here"),
      ),
    );
  }
}