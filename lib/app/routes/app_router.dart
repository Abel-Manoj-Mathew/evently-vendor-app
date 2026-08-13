import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/auth/login/login_generator.dart';
import 'package:evently_vendor_app/features/auth/login_mobile/login_mobile_generator.dart';
import 'package:evently_vendor_app/features/auth/login_otp/login_otp_generator.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginGenerator(),
    ),
    GoRoute(
      path: AppRoutes.loginMobile,
      builder: (context, state) => const LoginMobileGenerator(),
    ),
    GoRoute(
      path: AppRoutes.loginOtp,
      builder: (context, state) {
        final phoneNumber = state.extra as String? ?? '';
        return LoginOtpGenerator(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Home View Generator Placeholder')),
      ),
    ),
  ],
);

