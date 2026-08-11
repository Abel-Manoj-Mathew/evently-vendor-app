import 'package:env/env.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Env test', () {
      expect(Env.supabaseUrl, isNotEmpty);
    });
  });
}
