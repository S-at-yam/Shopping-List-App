import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_item.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GroceryItem> groceryItemsList = groceryItems;

    return Scaffold(
      appBar: AppBar(title: Text('Your Groceries')),
      body: ListView.builder(
        itemCount: groceryItemsList.length,
        itemBuilder: (ctx, index) {
          return SizedBox(
            height: 50,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(groceryItemsList[index].name),
              leading: Container(
                margin: EdgeInsets.all(10),
                width: 25,
                height: 25,
                color: groceryItemsList[index].category.typeColor,
              ),
              trailing: Text('${groceryItemsList[index].quantity}'),
            ),
          );
        },
      ),
    );
  }
}
