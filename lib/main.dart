import 'package:flutter/material.dart';

import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './dummy-data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      // EVERY ITERABLE MUST HAVE .toList()
      _availableMeals = DUMMY_MEALS.where((meal) {
        // return false if we dont want to include item
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),
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
