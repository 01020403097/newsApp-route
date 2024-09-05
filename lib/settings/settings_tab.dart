import 'package:flutter/material.dart';
import 'package:news_app_route/settings/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../style/app_theme.dart';



class SettingsTab extends StatelessWidget {
  static const String routeName = 'settingsTab';

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return Scaffold(
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),

            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.sizeOf(context).width * 0.05),
              child: Text(
                AppLocalizations.of(context)!.language,
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
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
                  border: Border.all(width: 2, color: AppTheme.primary)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: settingProvider.language,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English',     style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.primary),),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text('العربيه',     style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.primary),),
                    ),
                  ],
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage == null) return;
                    settingProvider.changeLanguage(selectedLanguage);
                  },
                ),
              ),
            ),
          ],
        ),
      )
    ;
  }
}
