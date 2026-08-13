import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'business_details_state.dart';

class BusinessDetailsViewModel extends Cubit<BusinessDetailsState> {
  BusinessDetailsViewModel() : super(const BusinessDetailsState());

  void onBusinessNameChanged(String val) {
    _validate(bName: val);
  }

  void onCategoryChanged(String val) {
    _validate(cat: val);
  }

  void onCityChanged(String val) {
    emit(state.copyWith(city: val));
  }

  void _validate({String? bName, String? cat}) {
    final name = (bName ?? state.businessName).trim();
    final category = (cat ?? state.category).trim();
    emit(state.copyWith(
      businessName: bName ?? state.businessName,
      category: cat ?? state.category,
      isValid: name.isNotEmpty && category.isNotEmpty,
    ));
  }

  void submit() {
    if (!state.isValid) return;
    emit(state.copyWith(status: BusinessDetailsStatus.submitting));
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!isClosed) {
        emit(state.copyWith(status: BusinessDetailsStatus.success));
      }
    });
  }
}
