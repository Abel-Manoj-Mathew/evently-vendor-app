import 'package:app_ui/app_ui.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/auth/login_mobile/login_mobile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((LoginMobileViewModel vm) => vm.state.isValid);
    final status = context.select((LoginMobileViewModel vm) => vm.state.status);

    return BlocListener<LoginMobileViewModel, LoginMobileState>(
      listener: (context, state) {
        if (state.status == LoginMobileStatus.success) {
          context.push(AppRoutes.loginOtp, extra: '+91 ${state.phoneNumber}');
        } else if (state.status == LoginMobileStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to send verification code. Please try again.')),
          );
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
              // Back Button
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 12),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF111827), size: 20),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Enter your mobile number',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                    height: 1.3,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'We\'ll send you a verification code to continue.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
              ),
              // Phone Input Field
              Container(
                height: 56,
                margin: const EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Country Code Dropdown (Mockup)
                    Container(
                      height: double.infinity,
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFAFAFA),
                        border: Border(
                          right: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(11), // 12 - 1 for border
                        ),
                      ),
                      child: Row(
                        children: const [
                          Text(
                            '+91',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF111827),
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.keyboard_arrow_down, size: 14, color: Color(0xFF9CA3AF)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (val) => context.read<LoginMobileViewModel>().onPhoneChanged(val),
                          decoration: const InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Primary Button
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: EventlyColors.primary.withValues(alpha: 0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: isValid && status != LoginMobileStatus.loading
                      ? () => context.read<LoginMobileViewModel>().submit()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EventlyColors.primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: EventlyColors.primary.withValues(alpha: 0.5),
                    disabledForegroundColor: Colors.white.withValues(alpha: 0.8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: status == LoginMobileStatus.loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text('Continue'),
                ),
              ),
              // Footer
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    'We\'ll only use this number for verification.',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
