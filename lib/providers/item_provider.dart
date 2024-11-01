import 'package:flutter/foundation.dart';
import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => [..._items];

  void addItem(String name, String description) {
    final newItem = Item(
        id: DateTime.now().toString(), name: name, description: description);
    _items.add(newItem);
    notifyListeners();
  }

  void editItem(String id, String newName, String newDescription) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].name = newName;
      _items[index].description = newDescription;
      notifyListeners();
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
