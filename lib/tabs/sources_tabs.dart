import 'package:flutter/material.dart';
import 'package:news_app_route/api_service/sourceResponse_model.dart';
import 'package:news_app_route/news/news_list.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:news_app_route/tabs/tab_item.dart';
import '../news/news_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {super.key});

  final List<Sources> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredSources = widget.sources
        .where((source) =>
    source.name != null &&
        source.name!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding:EdgeInsetsDirectional.symmetric(vertical: 8,horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search ...',
              suffixIcon: Icon(Icons.search),
           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary),
    borderRadius: BorderRadius.circular(30)),

           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary),
           borderRadius: BorderRadius.circular(30)

           ),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
        // Tab Bar
        Expanded(
          child: DefaultTabController(
            length: filteredSources.length,
            child: Column(
              children: [
                TabBar(
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  onTap: (index) => setState(() {
                    selectedTabIndex = index;
                  }),
                  tabs: filteredSources
                      .map((source) => TabItem(
                      isSelected: filteredSources.indexOf(source) == selectedTabIndex,
                      source: source.name ?? ''))
                      .toList(),
                ),
                Expanded(
                  child: filteredSources.isNotEmpty
                      ? NewsList(filteredSources[selectedTabIndex].id ?? '')
                      : Center(child: Text('No categories found')),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
