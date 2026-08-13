import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/splash/splash_view.dart';
import 'package:evently_vendor_app/features/splash/splash_view_model.dart';

class SplashGenerator extends StatelessWidget {
  const SplashGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashViewModel(),
      child: const SplashView(),
    );
  }
}
