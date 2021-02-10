import 'package:delicious_meals/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  SwitchListTile _buildListTile(
      bool currentValue, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (index) {
        setState(() {
          updateValue();
        });
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final Map selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildListTile(
                    _glutenFree,
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    () => _glutenFree = !_glutenFree),
                _buildListTile(
                    _vegetarian,
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    () => _vegetarian = !_vegetarian),
                _buildListTile(
                    _lactoseFree,
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    () => _lactoseFree = !_lactoseFree),
                _buildListTile(_vegan, 'Vegan', 'Only include vegan meals.',
                    () => _vegan = !_vegan)
              ],
            ))
          ],
        ));
  }
}
