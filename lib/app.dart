import 'package:flutter/material.dart';
import 'package:pixbit/providers/app_provider.dart';

import 'package:pixbit/resource/routes_manager.dart';
import 'package:pixbit/resource/theme_manager.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  // MyApp({Key? key}) : super(key: key); //default constructor
  const MyApp._initernal(); //private named constructor
  static const MyApp instance =
      MyApp._initernal(); //single instance --single ton
  factory MyApp() => instance; //factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getApplicationTheme(),
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
