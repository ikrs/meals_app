import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      // map each dummy data to CategoryItem
      children: DUMMY_CATEGORIES
          .map(
            (categoryData) => CategoryItem(
              categoryData.id,
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
    );
  }
}
