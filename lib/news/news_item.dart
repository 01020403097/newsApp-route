import 'package:flutter/material.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

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
            child: Image.asset(
              'assets/images/newsTest.png',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'BBC news',
            style: titleSmall?.copyWith(color: AppTheme.gray, fontSize: 10),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'why are football biggest clibs starting a new tournament ? ',
            style: titleSmall?.copyWith(fontWeight: FontWeight.w500),
          ),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(timeago.format(DateTime.now(),),style: titleSmall?.copyWith(color: AppTheme.gray,fontSize: 13),))
        ],
      ),
    );
  }
}
