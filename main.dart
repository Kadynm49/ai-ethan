import 'dart:async';
import 'dart:convert';
import 'package:markov/markov.dart';
import 'package:twitter_api/twitter_api.dart';
import 'dart:io' show File;
import 'dart:convert' show json;

Future<void> main() async {
  final file = new File('/home/erviewre/ai-ethan/tweets.txt');
  Stream<List<int>> inputStream = file.openRead();

  final chain = await inputStream
    .transform(const Utf8Decoder())
    .transform(const LineSplitter())
    .pipe(MarkovChainGenerator(2));

  // Take just one tweet worth of generated content (terminated by a newline).
  final List<Token> tokens = chain.generate().takeWhile((token) => token.string != '\n').toList();

  // Get twitter api keys from json file
  Map config = json.decode(await new File('config.json').readAsString());

  final _twitterOauth = new twitterApi(
    consumerKey: config["consumerKey"],
    consumerSecret: config["consumerSecret"],
    token: config["token"],
    tokenSecret: config["tokenSecret"]
  );

  // Make the request to twitter
  Future twitterRequest = _twitterOauth.getTwitterRequest(
    "POST",
    "statuses/update.json",
    options: {
      "status": format(tokens)
    }
  );

  // Wait for the future to finish
  var res = await twitterRequest;

  print(res.statusCode);
  print(res.body);
}
