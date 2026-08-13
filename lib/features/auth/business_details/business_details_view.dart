import 'package:app_ui/app_ui.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/auth/business_details/business_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BusinessDetailsView extends StatefulWidget {
  const BusinessDetailsView({super.key});

  @override
  State<BusinessDetailsView> createState() => _BusinessDetailsViewState();
}

class _BusinessDetailsViewState extends State<BusinessDetailsView> {
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final FocusNode _businessNameFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();

  final List<String> _categories = [
    'Venue & Decor',
    'Photography & Video',
    'Catering & Food',
    'Event Planning',
    'DJ & Music',
    'Beauty & Makeup',
    'Other Services',
  ];

  @override
  void initState() {
    super.initState();
    _businessNameFocus.addListener(() => setState(() {}));
    _cityFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _cityController.dispose();
    _businessNameFocus.dispose();
    _cityFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BusinessDetailsViewModel, BusinessDetailsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == BusinessDetailsStatus.success) {
          context.go(AppRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: EventlyColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        'Tell us about your business',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 310),
                        child: const Text(
                          'Set up your business profile to start receiving event bookings and manage customers.',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Business Name Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Business Name',
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
                          BlocBuilder<BusinessDetailsViewModel, BusinessDetailsState>(
                            buildWhen: (p, c) => p.businessName != c.businessName,
                            builder: (context, state) {
                              final isFocused = _businessNameFocus.hasFocus || state.businessName.isNotEmpty;
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
                                  controller: _businessNameController,
                                  focusNode: _businessNameFocus,
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (val) => context
                                      .read<BusinessDetailsViewModel>()
                                      .onBusinessNameChanged(val),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF111827),
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'e.g. Royal Wedding & Decor',
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
                      // Service Category Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Service Category',
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
                          BlocBuilder<BusinessDetailsViewModel, BusinessDetailsState>(
                            buildWhen: (p, c) => p.category != c.category,
                            builder: (context, state) {
                              final isSelected = state.category.isNotEmpty;
                              return Container(
                                height: 52,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFFFF4040) : const Color(0xFFE5E7EB),
                                    width: isSelected ? 2.0 : 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: isSelected ? state.category : null,
                                    hint: const Text(
                                      'Select category',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF9CA3AF),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF6B7280),
                                    ),
                                    items: _categories.map((cat) {
                                      return DropdownMenuItem<String>(
                                        value: cat,
                                        child: Text(
                                          cat,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF111827),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      if (val != null) {
                                        context
                                            .read<BusinessDetailsViewModel>()
                                            .onCategoryChanged(val);
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // City / Location Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'City / Location',
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
                          BlocBuilder<BusinessDetailsViewModel, BusinessDetailsState>(
                            buildWhen: (p, c) => p.city != c.city,
                            builder: (context, state) {
                              final isFocused = _cityFocus.hasFocus;
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
                                  controller: _cityController,
                                  focusNode: _cityFocus,
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (val) => context
                                      .read<BusinessDetailsViewModel>()
                                      .onCityChanged(val),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF111827),
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'e.g. San Francisco, CA',
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
                  const SizedBox(height: 60),
                  // Complete Setup Button
                  BlocBuilder<BusinessDetailsViewModel, BusinessDetailsState>(
                    buildWhen: (p, c) => p.isValid != c.isValid || p.status != c.status,
                    builder: (context, state) {
                      final isSubmitting = state.status == BusinessDetailsStatus.submitting;
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
                                  ? () => context.read<BusinessDetailsViewModel>().submit()
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
                                  : const Text('Complete Setup'),
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
      ),
    );
  }
}
