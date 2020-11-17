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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspirational Quotes'),
      ),
      body: Center(
        child: Text(_pickQuote()),
      ),
    );
  }
}