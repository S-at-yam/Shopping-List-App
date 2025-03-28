import 'package:flutter/material.dart';

import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/screens/new_item_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final List<GroceryItem> _groceryList = [];
  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItemScreen()));

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryList.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryList.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Center(child: Text('Nothing Here...'));

    final List<GroceryItem> groceryItemsList = _groceryList;

    if (groceryItemsList.isNotEmpty) {
      activeScreen = ListView.builder(
        itemCount: groceryItemsList.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            onDismissed: (direction) {
              _removeItem(groceryItemsList[index]);
            },
            key: ValueKey(groceryItemsList[index].id),
            child: ListTile(
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
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: activeScreen,
    );
  }
}
