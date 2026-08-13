part of 'business_details_view_model.dart';

enum BusinessDetailsStatus { initial, submitting, success, failure }

class BusinessDetailsState extends Equatable {
  const BusinessDetailsState({
    this.businessName = '',
    this.category = '',
    this.city = '',
    this.isValid = false,
    this.status = BusinessDetailsStatus.initial,
    this.error,
  });

  final String businessName;
  final String category;
  final String city;
  final bool isValid;
  final BusinessDetailsStatus status;
  final String? error;

  BusinessDetailsState copyWith({
    String? businessName,
    String? category,
    String? city,
    bool? isValid,
    BusinessDetailsStatus? status,
    String? error,
  }) {
    return BusinessDetailsState(
      businessName: businessName ?? this.businessName,
      category: category ?? this.category,
      city: city ?? this.city,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [businessName, category, city, isValid, status, error];
}
