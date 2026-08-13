import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_mobile_state.dart';

class LoginMobileViewModel extends Cubit<LoginMobileState> {
  LoginMobileViewModel() : super(const LoginMobileState());

  void onPhoneChanged(String phone) {
    final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');
    emit(state.copyWith(
      phoneNumber: phone,
      isValid: digitsOnly.length >= 10,
    ));
  }
}
