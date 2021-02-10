import 'package:flutter/material.dart';
import '../meal.dart';
import '../meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const String routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool doneInit = false;

  @override
  void didChangeDependencies() {
    if (!doneInit) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = args['title'];
      final String categoryId = args['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      doneInit = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(displayedMeals[index]);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
