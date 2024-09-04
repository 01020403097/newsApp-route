import 'package:flutter/material.dart';
import 'package:news_app_route/api_service/news_response_model.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.article, {super.key});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(5)),
            child: Image.network(
              article.urlToImage ?? 'https://t3.ftcdn.net/jpg/04/60/01/36/360_F_460013622_6xF8uN6ubMvLx0tAJECBHfKPoNOR5cRa.jpg',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            article.source?.name ?? '',
            style: titleSmall?.copyWith(color: AppTheme.gray, fontSize: 10),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              _showArticleDetails(context);
            },
            child: Text(
              article.title ?? '',
              style: titleSmall?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(
                DateTime.now(),
              ),
              style: titleSmall?.copyWith(color: AppTheme.gray, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  void _showArticleDetails(BuildContext context) {
    showModalBottomSheet(

      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(

          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  article.urlToImage ?? 'https://t3.ftcdn.net/jpg/04/60/01/36/360_F_460013622_6xF8uN6ubMvLx0tAJECBHfKPoNOR5cRa.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                article.source?.name?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.gray),
              ),
              const SizedBox(height: 8),
              Text(
                article.title ?? '',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'view full Article',

                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.black,fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Icon(Icons.arrow_right))
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
