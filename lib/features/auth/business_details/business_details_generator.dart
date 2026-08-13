import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/business_details/business_details_view.dart';
import 'package:evently_vendor_app/features/auth/business_details/business_details_view_model.dart';

class BusinessDetailsGenerator extends StatelessWidget {
  const BusinessDetailsGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessDetailsViewModel(),
      child: const BusinessDetailsView(),
    );
  }
}
