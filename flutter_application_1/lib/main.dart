import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  SignInView createState() => SignInView();
}

class SignInView extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('signal')),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: _buildSignIn(),
      ),
    );
  }

  Widget _buildSignIn() {
    return Column(children: [
      TextField(
        onSubmitted: (String text) {
          setState(() {
            if (true) {
            } else {}
          });
        },
        decoration: InputDecoration(hintText: "id"),
      ),
      TextField(
        onSubmitted: (String text) {
          setState(() {
            if (true) {
            } else {}
          });
        },
        decoration: InputDecoration(hintText: "pw"),
      ),
      CupertinoButton.filled(
        onPressed: () {},
        child: Text("sign in"),
        disabledColor: CupertinoColors.inactiveGray,
      )
    ]);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
