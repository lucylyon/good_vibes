import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:good_vibes/Friends.dart';

void main() {
  JsonCodec encoder = JsonCodec();
  test('Friend should be encoded and decoded', () {
    Friend friend = Friend('127.0.0.1', 'self');
    String jsonString = encoder.encode(friend);
    print(jsonString);
    Map friendMap = encoder.decode(jsonString);
    Friend decodedFriend = Friend.fromJson(friendMap);
    expect(decodedFriend.name, friend.name);
    expect(decodedFriend.ipAddress, friend.ipAddress);
  });
}