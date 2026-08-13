import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_otp_state.dart';

class LoginOtpViewModel extends Cubit<LoginOtpState> {
  LoginOtpViewModel() : super(const LoginOtpState());

  void onOtpChanged(String otp) {
    emit(state.copyWith(
      otp: otp,
      isValid: otp.length == 6,
    ));
  }
}
