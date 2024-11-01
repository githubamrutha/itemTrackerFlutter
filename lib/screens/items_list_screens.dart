import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context).items;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Item Tracker"),
          backgroundColor: const Color.fromARGB(255, 153, 197, 233),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Provider.of<ItemProvider>(context, listen: false)
                      .removeItem(item.id);
                },
              ),
              onTap: () {
                Navigator.pushNamed(context, '/edit', arguments: item.id);
              },
            );
          },
        ),
        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            // Set the width based on screen size
            double buttonWidth = constraints.maxWidth > 600
                ? MediaQuery.of(context).size.width /
                    4 // For larger screens (web/tablet)
                : MediaQuery.of(context).size.width /
                    2; // For smaller screens (mobile)

            return Container(
              width: buttonWidth,
              child: FloatingActionButton.extended(
                label: const Text("Add an item"),
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
              ),
            );
          },
        ));
  }
}
