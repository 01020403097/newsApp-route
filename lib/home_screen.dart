import 'package:flutter/material.dart';
import 'package:news_app_route/category/categories_grid.dart';
import 'package:news_app_route/category/category_details.dart';
import 'package:news_app_route/category/category_model.dart';
import 'package:news_app_route/drawer/home_drawer.dart';
import 'package:news_app_route/settings/settings_tab.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        drawer: HomeDrawer(
          omItemSelection: onDrawerItemSelected,
        ),
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.newsApp),
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
