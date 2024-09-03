import 'package:flutter/material.dart';
import 'package:news_app_route/tabs/tab_item.dart';

import '../news/news_item.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {super.key});

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  int selectedTabIndex=0;
  final sources = List.generate(10, (index) => 'Source $index',);
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
           onTap: (index) =>setState(() {
             selectedTabIndex=index;
           }) ,
            tabs: sources.map(
                (source) => TabItem(isSelected: sources.indexOf(source)==selectedTabIndex, source: source)).toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (context, index) =>NewsItem()),
        )
      ],
    );
  }
}
