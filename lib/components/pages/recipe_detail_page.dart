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

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Text('Slider value: $_sliderVal'),
            TextButton(
              onPressed: () => context.go(RecipesPage.path),
              child: const Text('Go to recipes page'),
            ),
            // TODO: Add Expanded

            Slider(
              // 10
              min: 1,
              max: 10,
              divisions: 9,
              // 11
              label: '$_sliderVal servings',
              // 12
              value: _sliderVal.toDouble(),
              // 13
              onChanged: (newValue) {
                setState(() => _sliderVal = newValue.round());
              },
              // 14
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
