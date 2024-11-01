import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'screens/items_list_screens.dart';
import 'screens/item_edit_screen.dart';

void main() {
  runApp(const ItemTrackerApp());
}

class ItemTrackerApp extends StatelessWidget {
  const ItemTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MaterialApp(
        title: 'Item Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ItemListScreen(),
          '/add': (context) => ItemEditScreen(),
          '/edit': (context) => ItemEditScreen(),
        },
      ),
    );
  }
}
