import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/login_mobile/login_mobile_view.dart';
import 'package:evently_vendor_app/features/auth/login_mobile/login_mobile_view_model.dart';

class LoginMobileGenerator extends StatelessWidget {
  const LoginMobileGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginMobileViewModel(),
      child: const LoginMobileView(),
    );
  }
}
