import 'dart:async';
import 'package:app_ui/app_ui.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/auth/login_otp/login_otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginOtpView extends StatefulWidget {
  const LoginOtpView({super.key, this.phoneNumber = ''});
  
  final String phoneNumber;

  @override
  State<LoginOtpView> createState() => _LoginOtpViewState();
}

class _LoginOtpViewState extends State<LoginOtpView> with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _cursorController;
  late Timer _timer;
  int _secondsRemaining = 30;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
    
    _startTimer();
  }
  
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _cursorController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginOtpViewModel>().state;
    final otp = state.otp;

    // Automatically navigate when 6 digits are entered
    if (state.isValid) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // In a real app, this might trigger a login call instead of immediate routing
        context.go(AppRoutes.home);
      });
    }
    
    final timerText = _secondsRemaining < 10 
        ? '00:0$_secondsRemaining' 
        : '00:$_secondsRemaining';

    return Scaffold(
      backgroundColor: EventlyColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Back Button
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF111827), size: 20),
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(height: 24),
                // Titles
                const Text(
                  'Verify your number',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter the 6-digit verification code sent to your mobile number.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),
                // Sent To Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SENT TO',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9CA3AF),
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.phoneNumber.isNotEmpty ? widget.phoneNumber : '+91 98765 43210',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const Text(
                        'Change Number',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: EventlyColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: EventlyColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                // OTP Input Boxes
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          final isFilled = index < otp.length;
                          final isActive = _focusNode.hasFocus && index == otp.length;
                          
                          Color borderColor = const Color(0xFFE5E7EB);
                          double borderWidth = 1;
                          Color bgColor = Colors.white;
                          
                          if (isFilled || isActive) {
                            borderColor = EventlyColors.primary;
                            borderWidth = 2;
                          }
                          if (isActive) {
                            bgColor = EventlyColors.primary.withOpacity(0.04);
                          }

                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: index == 5 ? 0 : 8),
                              height: 56,
                              decoration: BoxDecoration(
                                color: bgColor,
                                border: Border.all(color: borderColor, width: borderWidth),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: isFilled
                                  ? Text(
                                      otp[index],
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF111827),
                                      ),
                                    )
                                  : isActive
                                      ? FadeTransition(
                                          opacity: _cursorController,
                                          child: Container(
                                            width: 2,
                                            height: 28,
                                            color: EventlyColors.primary,
                                          ),
                                        )
                                      : null,
                            ),
                          );
                        }),
                      ),
                      Positioned.fill(
                        child: TextField(
                          focusNode: _focusNode,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          maxLength: 6,
                          onChanged: (val) => context.read<LoginOtpViewModel>().onOtpChanged(val),
                          style: const TextStyle(color: Colors.transparent),
                          cursorColor: Colors.transparent,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Timer and Info
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'RESEND AVAILABLE IN',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9CA3AF),
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        timerText,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                          letterSpacing: 0.6,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Verification starts automatically after entering all 6 digits.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
