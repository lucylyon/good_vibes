import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:good_vibes/Lists.dart';

class ReadAndWrite {
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
}