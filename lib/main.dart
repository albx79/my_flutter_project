import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './dice.dart';

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
        body: new Column(
          children: <Widget>[
            new NameScreen(),
            new RollScreen()
          ],
        ),
      ),
    );
  }
}

enum GameEntity {
  character,
  ship,
  system
}

class NameScreen extends StatefulWidget {
  @override
  State createState() => new NameState();
}

class NameState extends State<NameScreen> {
  String latestName = '...';

  void _generateName(GameEntity entity) {
    setState(() {
      latestName = 'New ' + entity.toString() + ' name';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new ButtonBar(
          children: [
            new MaterialButton(onPressed: () {
              _generateName(GameEntity.character);
            }, child: new Text("Character"),),
          ],
        ),
        new Text(latestName)
      ],
    );
  }
}

class RollScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RollState();
}

class RollState extends State<RollScreen> {
  String latestRoll = '...';

  void _roll(List<Dice> diceSet) {
    setState(() { latestRoll = '' + diceSet.toString() + ' rolled, got ' + roll(diceSet).toString(); });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new ButtonBar(
          children: <Widget>[
            _createRollButton(n2D6),
            _createRollButton(n4DF),
            _createRollButton(n1D20),
          ],
        ),
        new Text(latestRoll)
      ],
    );
  }

  MaterialButton _createRollButton(Dice dice) =>
      new MaterialButton(
        onPressed: () { _roll([dice]); },
        child: new Text("Roll " + dice.toString())
      );
}
