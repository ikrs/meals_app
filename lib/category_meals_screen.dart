import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recepies'),
      ),
      body: Center(
        child: Text('The Recepies for the category'),
      ),
    );
  }
}
