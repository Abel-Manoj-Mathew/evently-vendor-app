import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/splash/splash_generator.dart';
import 'package:evently_vendor_app/features/auth/login/login_generator.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashGenerator(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginGenerator(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Home View Generator Placeholder')),
      ),
    ),
  ],
);

