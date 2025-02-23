import 'package:flutter/material.dart';
import 'package:news_app_route/api_service/sourceResponse_model.dart';
import 'package:news_app_route/news/news_list.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:news_app_route/tabs/tab_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
          padding:EdgeInsetsDirectional.symmetric(vertical: MediaQuery.sizeOf(context).height*0.01,
              horizontal: MediaQuery.sizeOf(context).width*0.04),
          child: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.search,
              suffixIcon: Icon(Icons.search),
           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary),
    borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.03)),

           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary),
           borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.03)

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
