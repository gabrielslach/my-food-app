import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_app/route_generator.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.orange[900],
      )),
      title: 'First Food App',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
