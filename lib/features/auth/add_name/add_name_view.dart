import 'package:app_ui/app_ui.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/auth/add_name/add_name_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNameView extends StatefulWidget {
  const AddNameView({super.key});

  @override
  State<AddNameView> createState() => _AddNameViewState();
}

class _AddNameViewState extends State<AddNameView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _firstNameFocus.addListener(() => setState(() {}));
    _lastNameFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNameViewModel, AddNameState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AddNameStatus.success) {
          context.go(AppRoutes.businessDetails);
        }
      },
      child: Scaffold(
        backgroundColor: EventlyColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar with Back Button
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF111827),
                        size: 20,
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                // Heading and Subtitle Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tell us about yourself',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: const Text(
                        "We'll use your name to personalize your workspace.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Form Fields Section
                Column(
                  children: [
                    // First Name Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'First Name',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111827),
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '*',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFF4040),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<AddNameViewModel, AddNameState>(
                          buildWhen: (p, c) => p.firstName != c.firstName,
                          builder: (context, state) {
                            final isFocused = _firstNameFocus.hasFocus || state.firstName.isNotEmpty;
                            return Container(
                              height: 52,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isFocused ? const Color(0xFFFF4040) : const Color(0xFFE5E7EB),
                                  width: isFocused ? 2.0 : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                controller: _firstNameController,
                                focusNode: _firstNameFocus,
                                textCapitalization: TextCapitalization.words,
                                onChanged: (val) => context.read<AddNameViewModel>().onFirstNameChanged(val),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF111827),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'First name',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Last Name Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111827),
                              ),
                            ),
                            Text(
                              'Optional',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<AddNameViewModel, AddNameState>(
                          buildWhen: (p, c) => p.lastName != c.lastName,
                          builder: (context, state) {
                            final isFocused = _lastNameFocus.hasFocus;
                            return Container(
                              height: 52,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isFocused ? const Color(0xFFFF4040) : const Color(0xFFE5E7EB),
                                  width: isFocused ? 2.0 : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                controller: _lastNameController,
                                focusNode: _lastNameFocus,
                                textCapitalization: TextCapitalization.words,
                                onChanged: (val) => context.read<AddNameViewModel>().onLastNameChanged(val),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF111827),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Last name',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                // Continue Button Section
                BlocBuilder<AddNameViewModel, AddNameState>(
                  buildWhen: (p, c) => p.isValid != c.isValid || p.status != c.status,
                  builder: (context, state) {
                    final isSubmitting = state.status == AddNameStatus.submitting;
                    final canSubmit = state.isValid && !isSubmitting;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: canSubmit
                                ? [
                                    const BoxShadow(
                                      color: Color(0x1AFF4040),
                                      blurRadius: 12,
                                      offset: Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: ElevatedButton(
                            onPressed: canSubmit
                                ? () => context.read<AddNameViewModel>().submit()
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF4040),
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: const Color(0xFFFF4040).withOpacity(0.5),
                              disabledForegroundColor: Colors.white.withOpacity(0.8),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: isSubmitting
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Continue'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
