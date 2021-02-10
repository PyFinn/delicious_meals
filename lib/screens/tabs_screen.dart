import 'package:flutter/material.dart';
import '../meal.dart';
import './categories.dart';
import './favorites_screen.dart';
import '../main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;

  int _selectedPage = 0;

  @override
  void initState() {
    _pages = [Categories(), FavoritesScreen(widget.favoriteMeals)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites')
        ],
      ),
    );
  }
}
