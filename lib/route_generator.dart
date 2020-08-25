import 'package:flutter/material.dart';

import 'pages/homePage.dart';
import 'pages/restoPage.dart';
import 'pages/restoMenuPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case '/restoPage':
        {
          if (args is String) {
            return MaterialPageRoute(builder: (_) => RestoPage());
          }
          return _errorRoute();
        }
      case '/restoMenuPage':
        {
          return MaterialPageRoute(builder: (_) => RestoMenuPage());
        }
      default:
        {
          return _errorRoute();
        }
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ));
    });
  }
}
