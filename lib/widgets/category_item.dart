import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    // adding context for Navigator to know what a current screen/page is
    // push a new page

    /* Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return CategoryMealsScreen(id, title);
      }),
    ); */

    // named route
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName, // const path name
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // adding onTap via InkWell witch is basically a GestureDetector
    return InkWell(
      onTap: () => selectCategory(
        context,
      ),
      splashColor: Theme.of(context).primaryColor,
      // this borderRadius should match borderRadius of parent, in this case a Container
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
