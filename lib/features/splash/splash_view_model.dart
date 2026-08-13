import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashViewModel extends Cubit<SplashState> {
  SplashViewModel() : super(const SplashState()) {
    _init();
  }

  Timer? _timer;

  void _init() {
    emit(state.copyWith(status: SplashStatus.loading, progress: 0.4));

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }
      final newProgress = state.progress + 0.03;
      if (newProgress >= 1.0) {
        timer.cancel();
        emit(state.copyWith(status: SplashStatus.completed, progress: 1.0));
      } else {
        emit(state.copyWith(progress: newProgress));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
