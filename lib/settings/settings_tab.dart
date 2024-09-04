import 'package:flutter/material.dart';

import '../style/app_theme.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName = 'settingsTab';

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            top: MediaQuery.sizeOf(context).height * 0.028),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.sizeOf(context).width * 0.05),
              child: Text(
                'language',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * 0.025,
                  horizontal: MediaQuery.sizeOf(context).width * 0.12),
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.sizeOf(context).width * 0.05),
              decoration: BoxDecoration(

                  border: Border.all(width: 2, color: AppTheme.primary)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text('العربيه',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                  onChanged: (selectedLanguage) {
                    selectedLanguage = selectedLanguage;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
