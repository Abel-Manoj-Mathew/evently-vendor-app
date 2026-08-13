part of 'login_otp_view_model.dart';

enum LoginOtpStatus { initial, loading, success, failure }

class LoginOtpState extends Equatable {
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

  @override
  List<Object?> get props => [otp, isValid, status];
}
