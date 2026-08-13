import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently_vendor_app/features/auth/add_name/add_name_view.dart';
import 'package:evently_vendor_app/features/auth/add_name/add_name_view_model.dart';

class AddNameGenerator extends StatelessWidget {
  const AddNameGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNameViewModel(),
      child: const AddNameView(),
    );
  }
}
