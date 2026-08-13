import 'package:authentication_client/authentication_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LoginMobileStatus { initial, loading, success, failure }

class LoginMobileState {
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
}

class LoginMobileViewModel extends Cubit<LoginMobileState> {
  LoginMobileViewModel({
    required this.authenticationClient,
  })  : super(const LoginMobileState());

  final AuthenticationClient authenticationClient;

  void onPhoneChanged(String phone) {
    // Basic validation: Check if it has at least 10 digits
    final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');
    emit(state.copyWith(
      phoneNumber: phone,
      isValid: digitsOnly.length >= 10,
      status: LoginMobileStatus.initial,
    ));
  }

  Future<void> submit() async {
    if (!state.isValid) return;
    
    emit(state.copyWith(status: LoginMobileStatus.loading));
    
    try {
      await authenticationClient.signInWithOtp(phone: '+91${state.phoneNumber}');
      emit(state.copyWith(status: LoginMobileStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginMobileStatus.failure));
    }
  }
}
