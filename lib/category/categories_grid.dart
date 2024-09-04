import 'package:flutter/material.dart';
import 'package:news_app_route/category/category_items.dart';
import 'package:news_app_route/category/category_model.dart';
import 'package:news_app_route/style/app_theme.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});

  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel>categories = [
       CategoryModel(
        id: 'sports',
          name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),
      const CategoryModel(
          id: 'business',
          name: 'Business', imageName: 'bussines', color: AppTheme.brown),
      const CategoryModel(
          id: 'general',
          name: 'General', imageName: 'environment', color: AppTheme.blue),
      const CategoryModel(
          id: 'science',
          name: 'science', imageName: 'science', color: AppTheme.lightBrown),
      const CategoryModel(
          id: 'technology',
          name: 'Technology', imageName: 'ai', color:AppTheme.primary),
      const CategoryModel(
          id: 'health',
          name: 'Health', imageName: 'health', color: AppTheme.pink),

    ];
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
            child: Text('Pick your category of interest', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppTheme.navy),),
          ),
          Expanded(
            child: GridView.builder(

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                final category=categories[index];
             return   GestureDetector(
                    onTap: () {
                      onCategorySelected(category);
                    },
                    child: CategoryItems(
                      index: index, category:category,));
              }
              ,
              itemCount: categories.length,
            ),
          ),

        ],
      ),
    );
  }
}
