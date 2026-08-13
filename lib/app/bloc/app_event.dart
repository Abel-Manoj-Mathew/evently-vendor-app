part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AppEvent {
  const AppStarted();
}

class AppPhoneSubmitted extends AppEvent {
  const AppPhoneSubmitted(this.phoneNumber);
  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class AppOtpVerified extends AppEvent {
  const AppOtpVerified();
}

class AppNameSubmitted extends AppEvent {
  const AppNameSubmitted({required this.firstName, required this.lastName});
  final String firstName;
  final String lastName;

  @override
  List<Object?> get props => [firstName, lastName];
}

class AppBusinessSubmitted extends AppEvent {
  const AppBusinessSubmitted({
    required this.businessName,
    required this.category,
    this.city = '',
  });

  final String businessName;
  final String category;
  final String city;

  @override
  List<Object?> get props => [businessName, category, city];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}
