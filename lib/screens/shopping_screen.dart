import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_item.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/screens/new_item_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  void _addItem() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewItemScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final List<GroceryItem> groceryItemsList = groceryItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: groceryItemsList.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(groceryItemsList[index].name),
            leading: Container(
              margin: EdgeInsets.all(10),
              width: 24,
              height: 24,
              color: groceryItemsList[index].category.typeColor,
            ),
            trailing: Text('${groceryItemsList[index].quantity}'),
          );
        },
      ),
    );
  }
}
