import 'dart:math';

enum NamedEntity {
  character,
  ship,
  system
}

class Syllables {
  Random _rand;
  var _syllables = ["mon", "fay", "shi", "zag", "blarg", "rash", "izen", "malo", "zak", "abo", "wonk"];
  var _suffixes = ["son", "li", "ssen", "kor"];

  Syllables(this._rand);

  String _pick() => _syllables[_rand.nextInt(_syllables.length)];

  // TODO use _suffixes for surnames
  String generate() {
    var numSyllables = _rand.nextInt(2) + 2;
    var name = new List.generate(numSyllables, (idx) => _pick()).join("");

    return name[0].toUpperCase() + name.substring(1);
  }
}

var _rand = new Random();

String newSyllabicName() {
  var syllables = new Syllables(_rand);
  return syllables.generate() + " " + syllables.generate();
}