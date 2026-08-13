part of 'add_name_view_model.dart';

enum AddNameStatus { initial, submitting, success, failure }

class AddNameState extends Equatable {
  const AddNameState({
    this.firstName = '',
    this.lastName = '',
    this.isValid = false,
    this.status = AddNameStatus.initial,
    this.error,
  });

  final String firstName;
  final String lastName;
  final bool isValid;
  final AddNameStatus status;
  final String? error;

  AddNameState copyWith({
    String? firstName,
    String? lastName,
    bool? isValid,
    AddNameStatus? status,
    String? error,
  }) {
    return AddNameState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, isValid, status, error];
}
