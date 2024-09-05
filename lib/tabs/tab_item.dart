import 'package:flutter/material.dart';
import 'package:news_app_route/style/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.isSelected, required this.source});

  final bool isSelected;
  final String source;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.03;
    final double verticalPadding = screenSize.height * 0.01;
    final double marginVertical = screenSize.height * 0.01;
    final double borderRadius = screenSize.width * 0.06;
    final double borderWidth = screenSize.width * 0.005;

    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      margin: EdgeInsetsDirectional.symmetric(vertical: marginVertical),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: AppTheme.primary,
          width: borderWidth,
        ),
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: isSelected ? AppTheme.white : AppTheme.primary,
          fontSize: screenSize.width * 0.04,
        ),
      ),
    );
  }
}
