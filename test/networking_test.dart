import 'package:flutter_test/flutter_test.dart';
import 'package:good_vibes/Networking.dart';
import 'package:good_vibes/Lists.dart';

void main() async {
  test('Quote should be add to quote list', ()async{
    Networking net = Networking();
    String quote = 'test';
    SocketOutcome outcome = await net.sendQuote(quote, friendList[0]);
    print(outcome.errorMessage);
    expect(outcome.connectionSuccessful, true);
    expect(quotes.contains(quote), true);
  });
}