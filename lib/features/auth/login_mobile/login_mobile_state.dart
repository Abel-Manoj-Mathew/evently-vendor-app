part of 'login_mobile_view_model.dart';

enum LoginMobileStatus { initial, loading, success, failure }

class LoginMobileState extends Equatable {
  const LoginMobileState({
    this.phoneNumber = '',
    this.isValid = false,
    this.status = LoginMobileStatus.initial,
  });

  final String phoneNumber;
  final bool isValid;
  final LoginMobileStatus status;

  LoginMobileState copyWith({
    String? phoneNumber,
    bool? isValid,
    LoginMobileStatus? status,
  }) {
    return LoginMobileState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, isValid, status];
}
