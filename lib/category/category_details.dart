import 'package:flutter/material.dart';
import 'package:news_app_route/api_service/api_service.dart';
import 'package:news_app_route/tabs/sources_tabs.dart';
import 'package:news_app_route/widgets/error_indicator.dart';
import 'package:news_app_route/widgets/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {super.key});

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIService.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return const ErrorIndicator();
          } else {
            final sources = snapshot.data?.sources ?? [];
            return SourcesTabs(sources);
          }
        });
  }
}
