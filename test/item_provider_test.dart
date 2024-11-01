import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../lib/providers/item_provider.dart';

void main() {
  test('Adding an item increases list count', () {
    final provider = ItemProvider();
    provider.addItem('Test Name', 'Test Description');
    expect(provider.items.length, 1);
  });
}
