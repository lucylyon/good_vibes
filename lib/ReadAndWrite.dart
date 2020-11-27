import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:good_vibes/Lists.dart';
import 'package:good_vibes/Friends.dart';

class ReadAndWrite {
  JsonCodec _codec = JsonCodec();

  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _quotesFile async {
    String path = await _localPath;
    return File('$path/good_vibes_quotes.txt');
  }

  Future<File> get _friendsFile async {
    String path = await _localPath;
    return File('$path/good_vibes_friends.txt');
  }

  Future<void> readInQuotes() async {
    try {
      File quotesFile = await _quotesFile;
      List<String> savedQuotes = await quotesFile.readAsLines();
      print(savedQuotes);
      quotes.addAll(savedQuotes);
    } catch (e) {
      print(e);
    }
  }

  Future<void> writeQuoteToFile(String newQuote) async {
    File quotesFile = await _quotesFile;
    await quotesFile.writeAsString(newQuote + '\n', mode: FileMode.append);
  }

  Future<void> readInFriends() async {
    try {
      File friendsFile = await _friendsFile;
      List<String> savedFriends = await friendsFile.readAsLines();
      print(savedFriends);
      for (String friend in savedFriends) {
        Map friendMap = _codec.decode(friend);
        friendList.add(Friend.fromJson(friendMap));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> writeFriendToFile(Friend newFriend) async {
    String friendString = _codec.encode(newFriend);
    File friendFile = await _friendsFile;
    await friendFile.writeAsString(friendString + '\n', mode: FileMode.append);
  }
}