import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/screens/new_item_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<GroceryItem> _groceryList = [];
  var _isLoading = true;

  void _loadItems() async {
    final url = Uri.https(
      'shopping-list-app-4022d-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category =
          categories.entries
              .firstWhere(
                (catItems) => catItems.value.type == item.value['category'],
              )
              .value;

      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    setState(() {
      _groceryList = loadedItems;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

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

    if (_isLoading) {
      activeScreen = const Center(child: CircularProgressIndicator());
    }

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
