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
      backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Press one of these buttons for good vibes",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center
            ),
            RaisedButton(
              padding: EdgeInsets.all(15),
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.of(context).pushNamed("/picture");
              },
              child: Text("Get a picture",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              )
            ),
            RaisedButton(
              padding: EdgeInsets.all(15),
              color: Colors.deepPurple,
              onPressed: () {
              Navigator.of(context).pushNamed("/quote");
            },
             child: Text("Get a quote",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28
        )),
        )
        ],
        )
    );
  }
}