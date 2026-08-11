import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:evently_vendor_app/features/auth/login/login_view_model.dart';

void main() {
  group('LoginViewModel', () {
    late LoginViewModel viewModel;

    setUp(() {
      viewModel = LoginViewModel();
    });

    test('initial state is LoginState()', () {
      expect(viewModel.state, const LoginState());
    });

    blocTest<LoginViewModel, LoginState>(
      'emits [loading, success] when login is called',
      build: () => viewModel,
      act: (vm) => vm.login(),
      wait: const Duration(seconds: 1),
      expect: () => const [
        LoginState(status: LoginStatus.loading),
        LoginState(status: LoginStatus.success),
      ],
    );
  });
}
