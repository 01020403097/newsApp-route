import 'package:flutter/material.dart';
import 'package:news_app_route/category/categories_grid.dart';
import 'package:news_app_route/style/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),),
        body:const CategoriesGrid() ,
      ),
    );
  }
}
