part of 'app_bloc.dart';

enum AppAuthStatus {
  unauthenticated,
  otpVerification,
  addName,
  businessDetails,
  authenticated,
}

class AppState extends Equatable {
  const AppState({
    this.status = AppAuthStatus.unauthenticated,
    this.phoneNumber = '',
    this.firstName = '',
    this.lastName = '',
    this.businessName = '',
    this.category = '',
    this.city = '',
  });

  final AppAuthStatus status;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String businessName;
  final String category;
  final String city;

  AppState copyWith({
    AppAuthStatus? status,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? businessName,
    String? category,
    String? city,
  }) {
    return AppState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      businessName: businessName ?? this.businessName,
      category: category ?? this.category,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props => [
        status,
        phoneNumber,
        firstName,
        lastName,
        businessName,
        category,
        city,
      ];
}
