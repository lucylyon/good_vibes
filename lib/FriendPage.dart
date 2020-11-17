import 'package:flutter/material.dart';
import 'package:good_vibes/Lists.dart';

class FriendPage extends StatefulWidget{

  @override
  State createState() => new FriendPageState();
}

class FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Friend Page'),
        ),
        body: Center(child: Text('this is the friend page'))
    );
  }
}
