import 'package:flutter/material.dart';

import './dummy-data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // every page should return Scaffold widget
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map(
              (categoryData) => CategoryItem(
                categoryData.title,
                categoryData.color,
              ),
            )
            .toList(),
        // grid delegate takes care of structuring the grid, must be called
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // each grid item will take 200 px
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, // dynamic width / height
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, // spacing between grid items
        ),
      ),
    );
  }
}
