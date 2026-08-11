import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/login/login_view.dart';
import 'package:evently_vendor_app/features/auth/login/login_view_model.dart';

class LoginGenerator extends StatelessWidget {
  const LoginGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewModel(),
      child: const LoginView(),
    );
  }
}
