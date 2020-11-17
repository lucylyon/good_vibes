import 'package:flutter/material.dart';
import 'package:good_vibes/FriendPage.dart';
import 'package:good_vibes/HomePage.dart';
import 'package:good_vibes/ResourcesPage.dart';

class BottomNavPage extends StatefulWidget{
  @override
  State createState() => new BottomNavPageState();
}

class BottomNavPageState extends State<BottomNavPage> {

  List<Widget> _children = [HomePage(), FriendPage(), ResourcesPage()];
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            navBarChoice("Home", Icons.home),
            navBarChoice("Friends", Icons.person),
            navBarChoice('Get help', Icons.error_outline)
          ],
          onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem navBarChoice(String text, IconData icon) {
    return BottomNavigationBarItem(
      title: Text(text),
      icon: Icon(icon),
      backgroundColor: Colors.deepPurple
    );
  }
}


