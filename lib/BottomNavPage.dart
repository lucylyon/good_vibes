import 'package:flutter/material.dart';
import 'FriendPage.dart';
import 'HomePage.dart';
import 'ResourcesPage.dart';
import 'Networking.dart';
import 'ReadAndWrite.dart';

class BottomNavPage extends StatefulWidget{
  @override
  State createState() => new BottomNavPageState();
}

class BottomNavPageState extends State<BottomNavPage> {
  List<Widget> _children;
  int _currentIndex = 0;
  Networking _network;
  ReadAndWrite _readAndWrite = ReadAndWrite();

  @override
  void initState() {
    super.initState();
    print('Setting up server');
    setUpNetwork().then((value) => print("Server set up"));
    _readAndWrite.readInQuotes().then((value) => print("Quotes read in"));
  }

  Future<void> setUpNetwork() async {
    _network = Networking();
    await _network.setUpServer();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _children = [HomePage(), FriendPage(network: _network,), ResourcesPage()];
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
      icon: Icon(icon, color: Colors.white),
      backgroundColor: Colors.black87
    );
  }
}



