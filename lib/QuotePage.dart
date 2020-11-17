import 'package:flutter/material.dart';
import 'package:good_vibes/Lists.dart';

class QuotePage extends StatefulWidget{

  @override
  State createState() => new QuotePageState();
}

class QuotePageState extends State<QuotePage> {

  String _pickQuote() {
    quotes.shuffle();
    return quotes[0];
  }

  @override
  Widget build(BuildContext context) {
    String quote = _pickQuote();
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text('Inspirational Quotes'),
      ),
      body: Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text( quote ,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            //fontFamily: Font
          )
        ),
       // Text('button here')
      RaisedButton(
          onPressed: () {
            quote = _pickQuote();
          },
          child: Text("this doesnt work"), //goal is to change to new quote
      )
      ]
      ),
      )
    );
  }
}