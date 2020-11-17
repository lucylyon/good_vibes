import 'package:flutter/material.dart';
import 'package:good_vibes/BottomNavPage.dart';
import 'package:good_vibes/PicturePage.dart';
import 'package:good_vibes/QuotePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Vibes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => BottomNavPage(),
        '/quote': (context) => QuotePage(),
        '/picture': (context) => PicturePage(),
      }
    );
  }
  //this is so rough
}
