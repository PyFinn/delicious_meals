import 'package:flutter/material.dart';

import '../meal.dart';
import '../meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
          child: Text('You have no favorites yet - start adding some!'));
    } else {
      return ListView.builder(itemBuilder: (context, index) {
        return MealItem(favoriteMeals[index]);
      });
    }
  }
}
