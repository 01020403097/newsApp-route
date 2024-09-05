import 'package:flutter/material.dart';
import 'package:news_app_route/api_service/news_response_model.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(this.article, {super.key});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.02;
    final double imageHeight = screenSize.height * 0.25;
    final double fontSizeSmall = screenSize.width * 0.03;
    final double fontSizeMedium = screenSize.width * 0.04;

    final TextStyle? titleSmall =
        Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: fontSizeSmall,
            );

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              article.urlToImage ??
                  'https://t3.ftcdn.net/jpg/04/60/01/36/360_F_460013622_6xF8uN6ubMvLx0tAJECBHfKPoNOR5cRa.jpg',
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: verticalPadding / 2),
          Text(
            article.source?.name ?? '',
            style: titleSmall?.copyWith(
                color: AppTheme.gray, fontSize: fontSizeSmall),
          ),
          SizedBox(height: verticalPadding / 2),
          GestureDetector(
            onTap: () {
              _showArticleDetails(context);
            },
            child: Text(
              article.title ?? '',
              style: titleSmall?.copyWith(
                  fontWeight: FontWeight.w500, fontSize: fontSizeMedium),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(DateTime.now()),
              style: titleSmall?.copyWith(
                  color: AppTheme.gray, fontSize: fontSizeSmall),
            ),
          ),
        ],
      ),
    );
  }

  void _showArticleDetails(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: screenSize.height * 0.9,
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  article.urlToImage ??
                      'https://t3.ftcdn.net/jpg/04/60/01/36/360_F_460013622_6xF8uN6ubMvLx0tAJECBHfKPoNOR5cRa.jpg',
                  height: screenSize.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                article.source?.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppTheme.gray),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Text(
                article.title ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * 0.05),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: screenSize.height * 0.03),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.viewFullArticle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.04),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
