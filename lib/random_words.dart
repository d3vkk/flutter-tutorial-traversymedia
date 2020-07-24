import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <String>[
    'Nemidaf',
    'Turks & Caicos Islands',
    'Tunisia',
    'Mozambique',
    'Senegal',
    'Canary Islands',
    'Chile',
    'Sint Maarten',
    'Namibia',
    'Qatar'
  ];

  final _secondrandomWordPairs = <String>[
    'Algeria',
    'Tajikistan',
    'Finland',
    'Guinea-Bissau',
    'Cocos (Keeling) Islands',
    'Japan',
    'Congo - Brazzaville',
    'Belgium',
    'Comoros',
    'Turkmenistan',
    'Greece',
    //ten, so far
    'Lesotho',
    'Macau SAR China',
    'Nigeria',
    'New Caledonia',
    'St. Barthélemy',
    'Diego Garcia',
    'Nauru',
    'Vietnam',
    'Panama',
    'Nicaragua',
    //twenty, so far
    'Eritrea',
    'United States',
    'Madagascar',
    'St. Martin',
    'Malawi',
    'Ghana',
    'Tonga',
    'United Arab Emirates',
    'Swaziland',
    'Ethiopia'
  ];

  //A set is a collection of objects that can only occur once
  final _savedWordPairs = Set<String>();

  //This widget builds the list
  //Note also, how to create a widget
  Widget _buildList() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        //This will iterate through the items
        itemBuilder: (context, item) {
          //Shows divider
          //Note also, if statement is shortened
          if (item.isOdd) return Divider();

          //Calculates number of wordpairs minus the divider
          final index = item ~/ 2;

          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(_secondrandomWordPairs);
          }

          return _buildRow(_randomWordPairs[index]);
        });
  }

  //This widget builds each row of the list
  Widget _buildRow(String pair) {
    //checks if it is in the set already
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(
        // uses ternary operator to display
        // different icons if it is saved or not
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          /*
            If already saved, tapping on the
            icon will remove it
            if not, it will add it
          */
          alreadySaved
              ? _savedWordPairs.remove(pair)
              : _savedWordPairs.add(pair);
        });
      },
    );
  }

  void _showSavedWordPairs() {
    Navigator.of(context).push(
      //changes the page
      MaterialPageRoute(builder: (BuildContext context) {
        /*
          An iterable is a list whose values
          are accessed one by one

          '.map' - returns the values in the
          '_SavedWordPairs' List one at a time
        */
        final Iterable<ListTile> _oneSavedWordPair =
            _savedWordPairs.map((String pair) {
          return ListTile(
            title: Text(
              pair,
              style: TextStyle(fontSize: 16.0),
            ),
          );
        });

        /*
          This collects all the Saved Word Pairs one at a time
          and places dividers between them using
          'ListTile.divideTiles('

          ').toList()' - converts all the Saved Word Pairs
          into a list

          Note also, that the List has type - Widget
          i.e. 'List<Widget>'
        */
        final List<Widget> _allSavedWordPairs = ListTile.divideTiles(
          context: context,
          tiles: _oneSavedWordPair,
        ).toList();

        //returns the whole page with the List Widget
        //nested inside the ListView Widget
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Saved WordPairs',
            ),
          ),
          body: ListView(children: _allSavedWordPairs),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WordPair Generator',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _showSavedWordPairs,
          ),
        ],
      ),
      body: _buildList(),
    );
  }
}
