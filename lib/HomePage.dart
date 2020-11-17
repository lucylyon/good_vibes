import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Press one of these buttons for good vibes", style: TextStyle(fontSize: 30)),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/picture");
              },
              child: Text("Get a picture", style: optionStyle,)
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/quote");
              },
              child: Text("Get a quote", style: optionStyle,),
            )
          ],
        )
        )
    );
  }
}