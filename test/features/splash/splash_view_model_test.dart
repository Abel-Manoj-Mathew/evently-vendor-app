import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:evently_vendor_app/features/splash/splash_view_model.dart';

void main() {
  group('SplashViewModel', () {
    test('initial state has progress and status loading', () {
      final viewModel = SplashViewModel();
      expect(viewModel.state.status, SplashStatus.loading);
      viewModel.close();
    });

    blocTest<SplashViewModel, SplashState>(
      'progresses and completes splash status',
      build: () => SplashViewModel(),
      wait: const Duration(seconds: 2),
      verify: (vm) {
        expect(vm.state.status, SplashStatus.completed);
        expect(vm.state.progress, 1.0);
      },
    );
  });
}
