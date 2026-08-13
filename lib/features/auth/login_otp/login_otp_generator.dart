import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/login_otp/login_otp_view.dart';
import 'package:evently_vendor_app/features/auth/login_otp/login_otp_view_model.dart';

class LoginOtpGenerator extends StatelessWidget {
  const LoginOtpGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginOtpViewModel(),
      child: const LoginOtpView(),
    );
  }
}
