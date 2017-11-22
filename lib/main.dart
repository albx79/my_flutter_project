import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './dice.dart';
import './names.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Sci-Fi RPG Toolkit';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          alignment: Alignment.topLeft,
          child: new Column(
            children: <Widget>[
              new NameScreen(),
              new Divider(),
              new RollScreen()
            ],
          ),
        ),
      ),
    );
  }
}

class MyStyles {
  static var sectionHeader = new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0);
  static var result = new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0);
}

class NameScreen extends StatefulWidget {
  @override
  State createState() => new NameState();
}

class NameState extends State<NameScreen> {
  String latestName = '...';

  void _generateName(NamedEntity entity) {
    setState(() {
      latestName = newSyllabicName();
    });
  }

  @override
  Widget build(BuildContext context) => _createScreen(
    title: "Name Generator",
    buttons: [
      _createFatButton(()=>_generateName(NamedEntity.character), "Character"),
      _createFatButton(()=>_generateName(NamedEntity.character), "Ship"),
      _createFatButton(()=>_generateName(NamedEntity.character), "System"),
    ],
    results: [new Text(latestName, style: MyStyles.result)]
  );
}

class RollScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RollState();
}

class RollState extends State<RollScreen> {
  List<int> latestRoll = new List();
  int total = 0;

  void _roll(List<Dice> diceSet) {
    setState(() {
      latestRoll = roll(diceSet);
      total = latestRoll.reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) => _createScreen(
    title: "Dice Roller",
    buttons: [
      _createRollButton(n2D6),
      _createRollButton(n4DF),
      _createRollButton(n1D20),
    ],
    results: [
      new Text("Result: " + latestRoll.join(", "), style: MyStyles.result,),
      new Text("Total: " + total.toString(), style: MyStyles.result,)
    ]
  );

  Widget _createRollButton(Dice dice) => _createFatButton(() => _roll([dice]), dice.toString());
}

Widget _createFatButton(void onPressed(), String text) => new RaisedButton(
    onPressed: onPressed,
    child: new Container(
        padding: const EdgeInsets.all(2.0),
        child: new Column(
          children: <Widget>[
            new Text(text),
            new Icon(Icons.add)
          ],
        )
    )
);

Widget _createScreen({String title, List<Widget> buttons, List<Widget> results}) =>  new Column(
  children: [
    new Text("Dice Roller",
        style: MyStyles.sectionHeader
    ),
    new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons,
    ),
    new Divider(height: 12.0, color: Colors.white,),
    new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: results,
    ),
  ],
);