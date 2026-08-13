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

    return Scaffold(
      backgroundColor: EventlyColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Enter your mobile number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We will send you a verification code to sign in.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              // Phone Input Field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // Country Code Dropdown (Mockup)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            '+1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF111827),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7280)),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 24, color: const Color(0xFFE5E7EB)),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (val) => context.read<LoginMobileViewModel>().onPhoneChanged(val),
                        decoration: const InputDecoration(
                          hintText: 'Phone number',
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Primary Button
              Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: isValid
                        ? () {
                            context.push(AppRoutes.loginOtp);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: EventlyColors.primary,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: EventlyColors.primary.withOpacity(0.5),
                      disabledForegroundColor: Colors.white.withOpacity(0.8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('Send Code'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
