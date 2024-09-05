import 'package:flutter/material.dart';
import 'package:news_app_route/home_screen.dart';
import 'package:news_app_route/settings/setting_provider.dart';
import 'package:news_app_route/style/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final settingProvider = SettingProvider();
  await settingProvider.loadPreferences();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SettingProvider>.value(value: settingProvider),
    ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

     routes: {
        HomeScreen.routeName:(context)=>const HomeScreen(),
     },
      initialRoute:HomeScreen.routeName ,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.language),


    );
  }
}