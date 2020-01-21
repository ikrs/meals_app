import 'package:flutter/material.dart';

import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(),//CategoriesScreen(),
      // defining named routes
      routes: {
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      // triggers if route cant be found or for highly dynamic apps
      onGenerateRoute: (settings) {
        /* if (settings.name == '/meal-detail') {
          return 'nesto';
        } else if (settings.name == '/something-else') {
          return 'nesto drugo';
        }
        return MaterialPageRoute(builder: (context)=> CategoriesScreen()); */
      },
      // reached when flutter faild to load screen, basically its an 404 error page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context)=> CategoriesScreen());
      },
    );
  }
}
