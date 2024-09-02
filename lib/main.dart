import 'package:flutter/material.dart';
import 'package:news_app_route/home_screen.dart';
import 'package:news_app_route/style/app_theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     routes: {
        HomeScreen.routeName:(context)=>const HomeScreen(),
     },
      initialRoute:HomeScreen.routeName ,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,


    );
  }
}