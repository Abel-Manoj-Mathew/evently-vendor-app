import 'package:flutter_bloc/flutter_bloc.dart';

class LoginMobileState {
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
}

class LoginMobileViewModel extends Cubit<LoginMobileState> {
  LoginMobileViewModel() : super(const LoginMobileState());

  void onPhoneChanged(String phone) {
    // Basic validation: Check if it has at least 10 digits
    final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');
    emit(state.copyWith(
      phoneNumber: phone,
      isValid: digitsOnly.length >= 10,
    ));
  }
}
