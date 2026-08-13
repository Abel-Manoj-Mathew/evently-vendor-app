import 'package:flutter_bloc/flutter_bloc.dart';

class LoginOtpState {
  const LoginOtpState({this.otp = '', this.isValid = false});
  
  final String otp;
  final bool isValid;

  LoginOtpState copyWith({
    String? otp,
    bool? isValid,
  }) {
    return LoginOtpState(
      otp: otp ?? this.otp,
      isValid: isValid ?? this.isValid,
    );
  }
}

class LoginOtpViewModel extends Cubit<LoginOtpState> {
  LoginOtpViewModel() : super(const LoginOtpState());

  void onOtpChanged(String otp) {
    emit(state.copyWith(
      otp: otp,
      isValid: otp.length == 6, // Assuming 6 digit OTP
    ));
  }
}
