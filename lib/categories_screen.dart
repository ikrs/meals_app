import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(children: <Widget>[
      
      // grid delegate takes care of structuring the grid, must be called
    ], gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      // each grid item will take 200 px
      maxCrossAxisExtent: 200,
      childAspectRatio: 3 / 2, // dynamic width / height
      mainAxisSpacing: 20. // spacing between grid items
    ));
  }
}