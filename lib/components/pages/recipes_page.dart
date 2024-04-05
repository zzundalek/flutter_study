import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/recipe_detail_hooks_page.dart';
import 'package:flutter_study/model/recipe.dart';
import 'package:go_router/go_router.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  static const path = '/recipes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Recipes page'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => context.go(RecipeDetail.getPath(index)),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image(image: AssetImage(Recipe.samples[index].imageUrl)),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        Recipe.samples[index].label,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Palatino',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
