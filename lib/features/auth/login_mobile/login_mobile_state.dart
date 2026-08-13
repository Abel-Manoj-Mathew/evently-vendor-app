part of 'login_mobile_view_model.dart';

class LoginMobileState extends Equatable {
  const LoginMobileState({this.phoneNumber = '', this.isValid = false});

  final String phoneNumber;
  final bool isValid;

  LoginMobileState copyWith({
    String? phoneNumber,
    bool? isValid,
  }) {
    return LoginMobileState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, isValid];
}
