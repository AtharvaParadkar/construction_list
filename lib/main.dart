import 'package:construction_application/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pending PO',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstants.pendingPoScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Routes not found: ${settings.name}')),
        ),
      ),
    );
  }
}
