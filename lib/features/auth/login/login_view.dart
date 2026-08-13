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
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Top Header Section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0x14FF4040), // rgba(255, 64, 64, 0.08)
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: CustomPaint(
                            painter: _ZapIconPainter(color: const Color(0xFFFF4040)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'E V E N T L Y',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                        letterSpacing: 2.4,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Middle Content Section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 310),
                      child: const Text(
                        'Manage your event business effortlessly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                          height: 1.36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 320),
                      child: const Text(
                        'Create bookings, manage customers, track services, and organize every event from one place.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF667085),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                // Action Section (Button & Terms text centered in middle layout)
                if (status == LoginStatus.loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: CircularProgressIndicator(
                      color: Color(0xFFFF4040),
                    ),
                  )
                else
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () => context.push(AppRoutes.loginMobile),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF4040),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          child: const Text('Continue with Mobile Number'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: const Text.rich(
                          TextSpan(
                            text: 'By continuing, you agree to ',
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
                              TextSpan(text: '.'),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF667085),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ZapIconPainter extends CustomPainter {
  const _ZapIconPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * (1.714 / 24)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();
    path.moveTo(4 * scaleX, 14 * scaleY);
    path.arcToPoint(
      Offset(3.22 * scaleX, 12.37 * scaleY),
      radius: Radius.circular(1 * scaleX),
      clockwise: false,
    );
    path.lineTo(13.12 * scaleX, 2.17 * scaleY);
    path.arcToPoint(
      Offset(13.98 * scaleX, 2.63 * scaleY),
      radius: Radius.circular(0.5 * scaleX),
    );
    path.lineTo(12.06 * scaleX, 8.65 * scaleY);
    path.arcToPoint(
      Offset(13 * scaleX, 10 * scaleY),
      radius: Radius.circular(1 * scaleX),
    );
    path.lineTo(20 * scaleX, 10 * scaleY);
    path.arcToPoint(
      Offset(20.78 * scaleX, 11.63 * scaleY),
      radius: Radius.circular(1 * scaleX),
    );
    path.lineTo(10.88 * scaleX, 21.83 * scaleY);
    path.arcToPoint(
      Offset(10.02 * scaleX, 21.37 * scaleY),
      radius: Radius.circular(0.5 * scaleX),
      clockwise: false,
    );
    path.lineTo(11.94 * scaleX, 15.35 * scaleY);
    path.arcToPoint(
      Offset(11 * scaleX, 14 * scaleY),
      radius: Radius.circular(1 * scaleX),
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ZapIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
