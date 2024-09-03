import 'package:flutter/material.dart';
import 'package:news_app_route/style/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.omItemSelection});
  final void Function(DrawerItem ) omItemSelection;

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.sizeOf(context).height;
    final screenWidth=MediaQuery.sizeOf(context).width;
    final titleLargeStyle=Theme.of(context).textTheme.titleLarge!.copyWith(fontSize:22 );
    return SizedBox(
      width: screenWidth*0.6,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height:screenHeight*0.2 ,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('News App!',style:titleLargeStyle ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 12,start: 12),
              color: AppTheme.white,
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    omItemSelection(DrawerItem.categories);
                  },
                  child: Row(children: [
                    const Icon(Icons.menu),
                    const SizedBox(width: 10,),
                    Text('Categories',style: titleLargeStyle.copyWith(color: AppTheme.black),),
                  ],),

                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    omItemSelection(DrawerItem.settings);
                  },
                  child: Row(children: [
                    const Icon(Icons.settings),
                    const SizedBox(width: 10,),
                    Text('Settings',style: titleLargeStyle.copyWith(color: AppTheme.black),),
                  ],),
                ),

              ],),
              
            ),
          )
        ],
      ),
    );
  }
}
enum DrawerItem{
  categories,
  settings;
}
