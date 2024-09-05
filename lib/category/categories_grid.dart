import 'package:flutter/material.dart';
import 'package:news_app_route/category/category_items.dart';
import 'package:news_app_route/category/category_model.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});

  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel>categories = [
       CategoryModel(
        id: 'sports',
          name: AppLocalizations.of(context)!.sports, imageName: 'ball', color: Color(0xFFC91c22)),
       CategoryModel(
          id: 'business',
          name: AppLocalizations.of(context)!.business, imageName: 'bussines', color: AppTheme.brown),
       CategoryModel(
          id: 'general',
          name: AppLocalizations.of(context)!.general, imageName: 'environment', color: AppTheme.blue),
       CategoryModel(
          id: 'science',
          name: AppLocalizations.of(context)!.science, imageName: 'science', color: AppTheme.lightBrown),
       CategoryModel(
          id: 'technology',
          name: AppLocalizations.of(context)!.technology, imageName: 'ai', color:AppTheme.primary),
       CategoryModel(
          id: 'health',
          name: AppLocalizations.of(context)!.health, imageName: 'health', color: AppTheme.pink),

    ];
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
            child: Text(AppLocalizations.of(context)!.pickYourCategoryOfInterest, style: Theme
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
