import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:good_vibes/ReadAndWrite.dart';
import 'package:good_vibes/Lists.dart';
import 'package:good_vibes/Friends.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Taken from:
  // https://flutter.dev/docs/cookbook/persistence/reading-writing-files
  setUpAll(() async {
    // Create a temporary directory.
    final directory = await Directory.systemTemp.createTemp();

    // Mock out the MethodChannel for the path_provider plugin.
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      // If you're getting the apps documents directory, return the path to the
      // temp directory on the test environment instead.
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });
  test('Quote should be added to file', () async {
    ReadAndWrite readAndWrite = ReadAndWrite();
    String testQuote = 'test';
    readAndWrite.writeQuoteToFile(testQuote);
    await readAndWrite.readInQuotes();
    print(quotes.last);
    expect(quotes.last, testQuote);
  });
  test('All quotes should be added to file', () async {
    ReadAndWrite readAndWrite = ReadAndWrite();
    List<String> testQuotes = ['test1', 'test2', 'test3'];
    print(quotes);
    for (String quote in testQuotes) {
      await readAndWrite.writeQuoteToFile(quote);
    }
    await readAndWrite.readInQuotes();
    print(quotes);
    for (String quote in testQuotes) {
      expect(quotes.contains(quote), true);
    }
  });
  test('New friend should be added to file', () async {
    ReadAndWrite readAndWrite = ReadAndWrite();
    Friend testFriend = Friend('0.0.0.0', 'test');
    await readAndWrite.writeFriendToFile(testFriend);
    await readAndWrite.readInFriends();
    print(friendList.last.name);
    expect(friendList.last.name, testFriend.name);
    expect(friendList.last.ipAddress, testFriend.ipAddress);
  });
}