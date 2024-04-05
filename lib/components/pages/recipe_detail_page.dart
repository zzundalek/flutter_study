import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/recipes_page.dart';
import 'package:flutter_study/model/recipe.dart';
import 'package:go_router/go_router.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    required this.recipe,
    super.key,
  });
  final Recipe recipe;

  static const path = '/recipes/:id';
  static String getPath(String id) => '/recipes/$id';

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Text('Slider value: $_sliderVal'),
            TextButton(
              onPressed: () => context.go(RecipesPage.path),
              child: const Text('Go to recipes page'),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '$_sliderVal servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() => _sliderVal = newValue.round());
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
