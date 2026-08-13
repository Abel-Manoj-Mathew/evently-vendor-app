import 'package:authentication_client/authentication_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_mobile_state.dart';

class LoginMobileViewModel extends Cubit<LoginMobileState> {
  LoginMobileViewModel({
    required this.authenticationClient,
  })  : super(const LoginMobileState());

  final AuthenticationClient authenticationClient;

  void onPhoneChanged(String phone) {
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
