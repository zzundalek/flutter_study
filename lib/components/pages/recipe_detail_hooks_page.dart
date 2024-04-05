import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_study/components/pages/recipes_page.dart';
import 'package:flutter_study/model/recipe.dart';
import 'package:go_router/go_router.dart';

class RecipeDetail extends HookWidget {
  const RecipeDetail({
    required this.recipe,
    super.key,
  });
  final Recipe recipe;

  static const path = '/recipes/:id';
  static String getPath(int id) => '/recipes/$id';

  @override
  Widget build(BuildContext context) {
    final sliderVal = useState(1);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Text('Slider value: ${sliderVal.value}'),
            TextButton(
              onPressed: () => context.go(RecipesPage.path),
              child: const Text('Go to recipes page'),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${sliderVal.value} servings',
              value: sliderVal.value.toDouble(),
              onChanged: (newValue) => sliderVal.value = newValue.toInt(),
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
