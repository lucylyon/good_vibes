import 'package:flutter/material.dart';
import 'Lists.dart';

class QuotePage extends StatefulWidget{

  @override
  State createState() => new QuotePageState();
}

class QuotePageState extends State<QuotePage> {

  String quote;

  String _pickQuote() {
    quotes.shuffle();
    return quotes[0];
  }

  @override
  Widget build(BuildContext context) {
    quote = _pickQuote();
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
          Padding(
            //bottomPadding:
            padding: EdgeInsets.fromLTRB(0,0,0,50),
            child: Text( quote ,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              //fontFamily: Font
            )
        ),
          ),
      RaisedButton(
        padding: EdgeInsets.all(10),
        color: Colors.pink,
          onPressed: () {
            setState(() => quote = _pickQuote());
          },
          child: Text("Get another quote",
              style: TextStyle(
              color: Colors.white,
              fontSize: 18),
      ))
      ]
      ),
      )
    );
  }
}