import 'dart:math';

class Dice {
  int qty;
  int sides;
  int offset = 0;
  String name;

  Dice({this.qty = 1, this.sides, this.offset = 0, this.name}) {
    if (name == null) {
      name = "d" + sides.toString();
      if (offset != 0)
        name += (offset > 0 ? "+" : "") + offset.toString();
    }
  }

  String toString() => (qty != 1 ? qty.toString() : "") + name;

  List<int> _roll(Random rand) {
    var results = new List<int>(qty);
    for (int i = 0; i < qty; i++) {
      results.add(rand.nextInt(sides) + 1 + offset);
    }
    return results;
  }
}

var n2D6 = new Dice(qty: 2, sides: 6);
var n4DF = new Dice(qty: 4, sides: 3, offset: -2, name: "dF");
var n1D20 = new Dice(sides: 20);

var _random = new Random();

List<int> roll(List<Dice> diceSet) {
  return diceSet.expand((d) => d._roll(_random)).toList(growable: false);
}