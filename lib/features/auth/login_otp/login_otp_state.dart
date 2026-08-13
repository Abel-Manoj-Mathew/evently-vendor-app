part of 'login_otp_view_model.dart';

class LoginOtpState extends Equatable {
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

  @override
  List<Object?> get props => [otp, isValid];
}
