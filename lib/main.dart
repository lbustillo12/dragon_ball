import 'package:flutter/material.dart';
import 'package:dragon_ball/src/router/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dragon Ball App',
      routerConfig: router,
    );
  }
}
