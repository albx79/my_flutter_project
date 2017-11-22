import "package:test/test.dart";
import '../lib/dice.dart';

void main() {
  group("Dice", () {
    test("Prints as NdS", () {
      var string = new Dice(qty: 7, sides: 43).toString();
      expect(string, equals("7d43"));
    });

    test("Prints offset if not zero", () {
      var string = new Dice(qty: 42, sides: 11, offset: 24).toString();
      expect(string, equals("42d11+24"));
    });

    test("Prints negative offset", () {
      var string = new Dice(qty: 23, sides: 8, offset: -3).toString();
      expect(string, equals("23d8-3"));
    });

    test("Prints name if provided", () {
      var string = new Dice(qty: 11, sides: 22, name: "foo").toString();
      expect(string, equals("11foo"));
    });

    test("Doesn't print quantity if it's 1", () {
      var string = new Dice(qty: 1, sides: 3).toString();
      expect(string, equals("d3"));
    });

    test("Defaults qty to 1", () {
      var dice = new Dice(sides: 23);
      expect(dice.qty, equals(1));
    });
  });

  group("A list of dice", () {
    test("Can be rolled", () {
      var outcome = roll([new Dice(qty: 3, sides: 7), new Dice(qty: 9, sides: 19)]);
      expect(outcome, hasLength(3 + 9));
    });
  });

}