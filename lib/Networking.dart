import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:good_vibes/Friends.dart';
import 'package:good_vibes/ReadAndWrite.dart';
import 'Lists.dart';

final int port = 4853;

class Networking{
  JsonCodec _encoder;
  ReadAndWrite _readAndWrite;

  Networking() {
    _encoder = JsonCodec();
    setUpServer();
  }

  Future<SocketOutcome> setUpServer() async {
    try {
      ServerSocket server = await ServerSocket.bind(InternetAddress.anyIPv4, port);
      server.listen(_listenToSocket);
      return SocketOutcome();
    } on SocketException catch (e) {
      return SocketOutcome(errorMessage: e.message);
    }
  }

  void _listenToSocket(Socket socket) {
    socket.listen((event) {
      _handleData(socket.address.address, event);
    });
  }

  void _handleData(String ip, Uint8List data) {
    print("received data from $ip");
    String message = _encoder.decode(String.fromCharCodes(data));
    quotes.add(message);
    print(quotes.last);
  }

  void saveQuote(String message) {
    _readAndWrite.writeQuoteToFile(message);
  }

  Future<SocketOutcome> sendQuote(String quote, Friend friend) async {
    try {
      print("Connecting to ${friend.name} at ${friend.ipAddress}");
      Socket socket = await Socket.connect(friend.ipAddress, port);
      print("Connected");
      socket.write(_encoder.encode(quote));
      socket.close();
      return SocketOutcome();
    } on SocketException catch (e) {
      return SocketOutcome(errorMessage: e.message);
    }
  }
}

class SocketOutcome {
  String _errorMessage;

  SocketOutcome({String errorMessage = ''}) {
    _errorMessage = errorMessage;
  }

  bool get connectionSuccessful => _errorMessage.length == 0;

  String get errorMessage => _errorMessage;
}