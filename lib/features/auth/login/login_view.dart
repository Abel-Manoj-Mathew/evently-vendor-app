import 'package:app_ui/app_ui.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/auth/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((LoginViewModel vm) => vm.state.status);

    return Scaffold(
      backgroundColor: EventlyColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Icon Container
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: EventlyColors.primary.withOpacity(0.08),
                  border: Border.all(
                    color: EventlyColors.primary.withOpacity(0.12),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.bolt,
                  color: EventlyColors.primary,
                  size: 36,
                ),
              ),
              const SizedBox(height: 12),
              // App Name
              const Text(
                'E V E N T L Y',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 32),
              // Title
              const Text(
                'Manage your event business effortlessly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Create bookings, manage customers, track services, and organize every event from one place.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                    height: 1.65,
                  ),
                ),
              ),
              const Spacer(),
              // Buttons and Footer
              if (status == LoginStatus.loading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 56),
                  child: CircularProgressIndicator(
                    color: EventlyColors.primary,
                  ),
                )
              else
                Column(
                  children: [
                    // Primary Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => context.push(AppRoutes.loginMobile),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EventlyColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text('Continue with Mobile Number'),
                      ),
                    ),
                    const SizedBox(height: 28),
                    // OR Divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFFE5E7EB),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFFE5E7EB),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    // Secondary Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle Google Login
                        },
                        icon: const Icon(
                          Icons.mail_outline,
                          color: EventlyColors.primary,
                          size: 18,
                        ),
                        label: const Text('Continue with Google'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF111827),
                          side: const BorderSide(color: Color(0xFFE5E7EB)),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Footer
                    const Text.rich(
                      TextSpan(
                        text: 'By continuing, you agree to\n',
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 56),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
