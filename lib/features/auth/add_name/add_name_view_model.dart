import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_name_state.dart';

class AddNameViewModel extends Cubit<AddNameState> {
  AddNameViewModel() : super(const AddNameState());

  void onFirstNameChanged(String val) {
    final trimmed = val.trim();
    emit(state.copyWith(
      firstName: val,
      isValid: trimmed.isNotEmpty,
    ));
  }

  void onLastNameChanged(String val) {
    emit(state.copyWith(
      lastName: val,
    ));
  }

  void submit() {
    if (!state.isValid) return;
    emit(state.copyWith(status: AddNameStatus.submitting));
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!isClosed) {
        emit(state.copyWith(status: AddNameStatus.success));
      }
    });
  }
}
