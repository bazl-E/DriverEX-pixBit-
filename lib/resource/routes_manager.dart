import 'package:flutter/material.dart';
import 'package:pixbit/resource/string_manager.dart';
import 'package:pixbit/screens/home_screen.dart';
import 'package:pixbit/screens/landing_screen.dart';
import 'package:pixbit/screens/signin_screen.dart';
import 'package:pixbit/screens/splash_screen.dart';
import 'package:pixbit/screens/user_detail_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String landingScreen = '/landing';
  static const String loginRoute = '/login';
  static const String home = '/home';
  static const String userDetails = '/userDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.landingScreen:
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case Routes.userDetails:
      //   return MaterialPageRoute(builder: (_) => UserDetailsScreen());

      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRoute),
        ),
        body: Center(
          child: Text(AppStrings.noRoute),
        ),
      ),
    );
  }
}
