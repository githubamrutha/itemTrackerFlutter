import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';

class ItemAddScreen extends StatelessWidget {
  final String? itemId;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  ItemAddScreen({this.itemId});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    final item = itemId != null
        ? itemProvider.items.firstWhere((item) => item.id == itemId)
        : null;

    _nameController.text = item?.name ?? '';
    _descriptionController.text = item?.description ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
        backgroundColor: const Color.fromARGB(255, 153, 197, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
                hintText: 'Enter name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.blue[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                // Responsive padding
                contentPadding: EdgeInsets.symmetric(
                  vertical:
                      MediaQuery.of(context).size.width > 600 ? 20.0 : 15.0,
                  horizontal:
                      MediaQuery.of(context).size.width > 600 ? 30.0 : 20.0,
                ),
              ),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
                hintText: 'Enter a description',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.blue[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                // Responsive padding
                contentPadding: EdgeInsets.symmetric(
                  vertical:
                      MediaQuery.of(context).size.width > 600 ? 20.0 : 15.0,
                  horizontal:
                      MediaQuery.of(context).size.width > 600 ? 30.0 : 20.0,
                ),
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
              maxLines: null,
            ),
            // SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                itemProvider.addItem(
                    _nameController.text, _descriptionController.text);

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 87, 130, 160), // Set your desired background color
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0), // Adjust padding as needed
              ),
              child: const Row(
                mainAxisSize: MainAxisSize
                    .min, // Ensures the button size is based on its content
                children: [
                  Icon(
                    Icons.add,
                    // Icon changes based on the action
                    color: Colors.white, // Icon color
                  ),
                  SizedBox(width: 8.0), // Spacing between icon and text
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
