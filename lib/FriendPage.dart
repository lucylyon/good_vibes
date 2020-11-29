import 'package:flutter/material.dart';
import 'package:good_vibes/Friends.dart';
import 'Lists.dart';
import 'Networking.dart';
import 'package:good_vibes/ReadAndWrite.dart';

class FriendPage extends StatefulWidget{
  FriendPage({Key key, this.network}) : super(key: key);

  final Networking network;

  @override
  State createState() => new FriendPageState();
}

class FriendPageState extends State<FriendPage> {
  ReadAndWrite _readAndWrite = ReadAndWrite();
  Friend _currentFriend = friendList[0];
  TextEditingController _messageController = TextEditingController();
  Color appBarColor = Colors.deepOrangeAccent;
  TextEditingController _friendNameController = TextEditingController();
  TextEditingController _friendIPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> menuList = _generateFriendMenu();
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
              textField("Type a quote for ${_currentFriend.name}", _messageController),
              RaisedButton(
                  padding: EdgeInsets.all(15),
                  color: appBarColor,
                  onPressed: () {
                      widget.network.sendQuote(
                          _messageController.text, _currentFriend);
                  },
                  child: Text("Send Quote",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
              ),
              Text("You can also add a new friend"),
              //
              textField("Friend name", _friendNameController),
              // textField("Friend IP", _friendIPController),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'IP address',
                ),
                keyboardType: TextInputType.number,
                controller: _friendIPController,
              ),
              //
              RaisedButton(
                  padding: EdgeInsets.all(15),
                  color: appBarColor,
                  onPressed: () {
                    setState(() {
                      Friend newFriend = Friend(
                          _friendIPController.text, _friendNameController.text);
                      _addFriend(newFriend);
                    });
                  },
                  child: Text("Add new friend",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }

  TextField textField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label
      ),
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

  void _addFriend(Friend newFriend) {
    friendList.add(newFriend);
    _readAndWrite.writeFriendToFile(newFriend);
  }
}
