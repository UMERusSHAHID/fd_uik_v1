# food_delivery_kit

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_kit/core/routes/app-routes.dart';

import 'features/auth/screens/welcome_page.dart';

void main() {
runApp(const MyApp());
}

final routes = appRoutes;

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return ScreenUtilInit(
designSize: const Size(414, 896),
minTextAdapt: true,
splitScreenMode: true,
builder: (context, child) {
return MaterialApp.router(
debugShowCheckedModeBanner: false,
routerConfig: appRoutes,
);
},
);
}
}
