import 'package:construction_application/pending_po/ui/pending_po.dart';
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
      home: PendingPoList(),
    );
  }
}
