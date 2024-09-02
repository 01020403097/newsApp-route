import 'package:flutter/material.dart';
import 'package:news_app_route/category/category_items.dart';
import 'package:news_app_route/category/category_model.dart';
import 'package:news_app_route/style/app_theme.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel>categories=[
      const CategoryModel(name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),
      const CategoryModel(name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),
      const CategoryModel(name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),
      const CategoryModel(name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),
      const CategoryModel(name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),
      const CategoryModel(name: 'Sports', imageName: 'ball', color: Color(0xFFC91c22)),

    ];
    return Padding(
      padding:  const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding:  const EdgeInsetsDirectional.symmetric(vertical: 24),
             child: Text('Pick your category of interest',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppTheme.navy),),
           ),
           Expanded(
             child: GridView.builder(

               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
               mainAxisSpacing: 24,
                 crossAxisSpacing: 24,
               ),
                 itemBuilder:(context, index) => CategoryItems(index: index, category: categories[index],),
                 itemCount: categories.length,
                 ),
           ),

         ],
      ),
    );
  }
}
