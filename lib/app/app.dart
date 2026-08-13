import 'package:flutter/material.dart';
import 'package:evently_vendor_app/app/routes/app_router.dart';
import 'package:app_ui/app_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Evently Vendor App',
      theme: EventlyTheme.theme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
