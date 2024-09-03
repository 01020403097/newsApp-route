import 'package:flutter/material.dart';
import 'package:news_app_route/style/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.isSelected, required this.source});

  final bool isSelected;
  final String source;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 6,horizontal: 10),
      margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            25,
          ),
        ),
        border: Border.all(color: AppTheme.primary, width: 2),
      ),
      child: Text(
        source,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: isSelected ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
