/*
  Note that country names were used instead of
  WordPairs from the english_words package
*/
import 'package:flutter/material.dart';
import 'package:wordpairgenerator/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[900],
      ),
      home: RandomWords(),
      debugShowCheckedModeBanner: false,
    );
  }
}
