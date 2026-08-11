import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/login/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((LoginViewModel vm) => vm.state.status);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (status == LoginStatus.loading)
              const CircularProgressIndicator()
            else if (status == LoginStatus.success)
              const Text('Login Success!')
            else
              ElevatedButton(
                onPressed: () => context.read<LoginViewModel>().login(),
                child: const Text('Login'),
              ),
          ],
        ),
      ),
    );
  }
}
