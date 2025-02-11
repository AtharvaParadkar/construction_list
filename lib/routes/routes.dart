import 'package:construction_application/pending_po/ui/pending_po.dart';
import 'package:construction_application/requisition_list/ui/requisition_list.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.pendingPoScreen:
        return MaterialPageRoute(
          builder: (_) => const PendingPoList(),
        );
      case RouteConstants.requisitionListScreen:
          return MaterialPageRoute(
            builder: (_) => RequisitionList(),
          );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      // const String routeName = '/ErrorRoute';
      return const Scaffold(
        body: Center(
          child: Text('Error'),
          // Text(StringConstants.errorOnNavigation),
        ),
      );
    });
  }
}

class RouteConstants {
  static const String pendingPoScreen = '/';
  static const String requisitionListScreen = '/RequisitionList';
}
