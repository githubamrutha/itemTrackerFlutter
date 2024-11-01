import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../lib/providers/item_provider.dart';
import '../lib/screens/items_list_screens.dart';

void main() {
  testWidgets('Add item button should be present', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ItemProvider(),
        child: MaterialApp(home: ItemListScreen()),
      ),
    );
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
