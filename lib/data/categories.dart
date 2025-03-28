import 'package:flutter/material.dart';

import 'package:shopping_list_app/models/category.dart';

const categories = {
  Categories.vegetables: Category(
    type: 'Vegetables',
    typeColor: Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    type: 'Fruit',
    typeColor: Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    type: 'Meat',
    typeColor: Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    type: 'Dairy',
    typeColor: Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    type: 'Carbs',
    typeColor: Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    type: 'Sweets',
    typeColor: Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    type: 'Spices',
    typeColor: Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    type: 'Convenience',
    typeColor: Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    type: 'Hygiene',
    typeColor: Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    type: 'Other',
    typeColor: Color.fromARGB(255, 0, 225, 255),
  ),
};
