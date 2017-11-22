import "package:test/test.dart";
import '../lib/names.dart';

void main() {
  test("generate beautiful character names", () {
    print(newSyllabicName());
  });
}