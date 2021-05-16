import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_demo_flutter_app/Facade/FacadeScreen.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierGameScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: SoldierGameScreen.routeName,
      routes: {
        '/': (context) => Scaffold(
              body: RandomWords(),
            ),
        SecondScreen.routeName: (context) => SecondScreen(),
        SoldierGameScreen.routeName: (context) => SoldierGameScreen(),
        FacadeScreen.routeName: (context) => FacadeScreen(),
      },
      // home: Scaffold(
      //   body: RandomWords(),
      // )
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // NEW
  final _biggerFont = const TextStyle(fontSize: 18); // NEW

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo App'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, SecondScreen.routeName,
            arguments: SecondScreenArgs(pair.asCamelCase));
      },
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  static const routeName = '/wordDetail';

  @override
  Widget build(BuildContext context) {
    final SecondScreenArgs args =
        ModalRoute.of(context).settings.arguments as SecondScreenArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Word Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              args.word,
              style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('is a perfect word because it is inside perfect flutter app')
          ],
        ),
      ),
    );
  }
}

class SecondScreenArgs {
  final String word;

  SecondScreenArgs(this.word);
}
