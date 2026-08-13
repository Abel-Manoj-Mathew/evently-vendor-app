import 'package:authentication_client/authentication_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LoginOtpStatus { initial, loading, success, failure }

class LoginOtpState {
  const LoginOtpState({
    this.otp = '', 
    this.isValid = false,
    this.status = LoginOtpStatus.initial,
  });
  
  final String otp;
  final bool isValid;
  final LoginOtpStatus status;

  LoginOtpState copyWith({
    String? otp,
    bool? isValid,
    LoginOtpStatus? status,
  }) {
    return LoginOtpState(
      otp: otp ?? this.otp,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }
}

class LoginOtpViewModel extends Cubit<LoginOtpState> {
  LoginOtpViewModel({
    required this.authenticationClient,
  })  : super(const LoginOtpState());

  final AuthenticationClient authenticationClient;

  void onOtpChanged(String otp) {
    emit(state.copyWith(
      otp: otp,
      isValid: otp.length == 6,
      status: LoginOtpStatus.initial,
    ));
  }

  Future<void> submit({required String phone}) async {
    if (!state.isValid) return;
    
    emit(state.copyWith(status: LoginOtpStatus.loading));
    
    try {
      await authenticationClient.verifyOtp(phone: phone, token: state.otp);
      emit(state.copyWith(status: LoginOtpStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginOtpStatus.failure));
    }
  }
}
