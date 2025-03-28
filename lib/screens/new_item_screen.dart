import 'package:flutter/material.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItemScreenState();
  }
}

class _NewItemScreenState extends State<NewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a new item')),
      body: Text('this is the form'),
    );
  }
}
