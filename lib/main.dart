import 'package:dashboard/routing/routing_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,//to make your app inside responsiveness
    useInheritedMediaQuery: true,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: MyRoute.onNavigateByName,
    onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
    // home:DashboardPage(),
  );
  runApp(DevicePreview(//to make your app responsive 
    enabled: true,
    builder: (context) => materialApp, // Wrap your app
  ),);
}