import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(const LoginState());

  void login() {
    emit(state.copyWith(status: LoginStatus.loading));
    // simulate login
    Future.delayed(const Duration(seconds: 1), () {
      if (!isClosed) emit(state.copyWith(status: LoginStatus.success));
    });
  }
}
