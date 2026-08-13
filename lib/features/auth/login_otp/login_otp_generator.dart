import 'package:authentication_client/authentication_client.dart';
import 'package:evently_vendor_app/app/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/login_otp/login_otp_view.dart';
import 'package:evently_vendor_app/features/auth/login_otp/login_otp_view_model.dart';

class LoginOtpGenerator extends StatelessWidget {
  const LoginOtpGenerator({super.key, this.phoneNumber = ''});
  
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginOtpViewModel(
        authenticationClient: getIt<AuthenticationClient>(),
      ),
      child: LoginOtpView(phoneNumber: phoneNumber),
    );
  }
}
