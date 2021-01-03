import 'package:flutter/material.dart';
import './original.dart';
import './meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = args['title'];
    final String categoryId = args['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
