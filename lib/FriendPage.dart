import 'package:flutter/material.dart';
import 'package:good_vibes/Friends.dart';
import 'Lists.dart';
import 'Networking.dart';

class FriendPage extends StatefulWidget{
  FriendPage({Key key, this.network}) : super(key: key);

  final Networking network;

  @override
  State createState() => new FriendPageState();
}

class FriendPageState extends State<FriendPage> {
  Friend _currentFriend;
  TextEditingController _controller = TextEditingController();
  Color appBarColor = Colors.deepOrangeAccent;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> menuList = _generateFriendMenu();
    _currentFriend = friendList[0];
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          title: const Text('Friend Page'),
          backgroundColor: appBarColor,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<Friend> (
                value: _currentFriend,
                onChanged: (Friend newValue) {
                  setState(() {
                    _currentFriend = newValue;
                  });
                },
                items: menuList
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Send a quote to ${_currentFriend.name}"
                ),
                onSubmitted: (String message) {
                  widget.network.sendQuote(message, _currentFriend);
                },
              )
            ],
          ),
        )
    );
  }

  List<DropdownMenuItem> _generateFriendMenu() {
    List<DropdownMenuItem<Friend>> itemList = [];
    for (Friend friend in friendList) {
      itemList.add(
        DropdownMenuItem(
          value: friend,
          child: Text(friend.name),
        )
      );
    }
    return itemList;
  }
}
