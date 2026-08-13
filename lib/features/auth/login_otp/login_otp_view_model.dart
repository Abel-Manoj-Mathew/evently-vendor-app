import 'package:authentication_client/authentication_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_otp_state.dart';

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
