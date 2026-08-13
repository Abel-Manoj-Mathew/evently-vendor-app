import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppStarted>(_onAppStarted);
    on<AppPhoneSubmitted>(_onAppPhoneSubmitted);
    on<AppOtpVerified>(_onAppOtpVerified);
    on<AppNameSubmitted>(_onAppNameSubmitted);
    on<AppBusinessSubmitted>(_onAppBusinessSubmitted);
    on<AppLogoutRequested>(_onAppLogoutRequested);
  }

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppAuthStatus.unauthenticated));
  }

  void _onAppPhoneSubmitted(AppPhoneSubmitted event, Emitter<AppState> emit) {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      status: AppAuthStatus.otpVerification,
    ));
  }

  void _onAppOtpVerified(AppOtpVerified event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppAuthStatus.addName));
  }

  void _onAppNameSubmitted(AppNameSubmitted event, Emitter<AppState> emit) {
    emit(state.copyWith(
      firstName: event.firstName,
      lastName: event.lastName,
      status: AppAuthStatus.businessDetails,
    ));
  }

  void _onAppBusinessSubmitted(
    AppBusinessSubmitted event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(
      businessName: event.businessName,
      category: event.category,
      city: event.city,
      status: AppAuthStatus.authenticated,
    ));
  }

  void _onAppLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    emit(const AppState(status: AppAuthStatus.unauthenticated));
  }
}
