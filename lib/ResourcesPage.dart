import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ResourcesPageState();
}

class ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Resources"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("You can find resources here")
      ),
    );
  }
}


