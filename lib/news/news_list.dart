import 'package:flutter/material.dart';
import 'package:news_app_route/api_service/api_service.dart';
import 'package:news_app_route/widgets/loading_indicator.dart';

import '../widgets/error_indicator.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList

  (

  this

      .

  sourceId,{super.key});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
  return FutureBuilder(
  future: APIService.getNews(sourceId),
  builder: (context,snapshot) {
  if(snapshot.connectionState==ConnectionState.waiting){
  return const LoadingIndicator();
  }else if(snapshot.hasError||snapshot.data?.status!='ok'){
  return const ErrorIndicator();
  }else{
    final newsList=snapshot.data?.articles??[];
  return ListView.builder(
  itemCount: newsList.length,
    itemBuilder: (context, index) =>  NewsItem(newsList[index]),);
  }


  }
  );
  }
}
