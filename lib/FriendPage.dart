import 'package:flutter/material.dart';
import 'Lists.dart';

class FriendPage extends StatefulWidget{

  @override
  State createState() => new FriendPageState();
}

class FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          title: const Text('Friend Page'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(child: Text('this is the friend page'))
    );
  }
}
