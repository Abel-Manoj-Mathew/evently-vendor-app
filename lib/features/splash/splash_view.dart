import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_ui/app_ui.dart';
import 'package:evently_vendor_app/app/routes/app_routes.dart';
import 'package:evently_vendor_app/features/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryRed = Color(0xFFFF4040);
    const darkTitleColor = Color(0xFF111827);
    const subtitleColor = Color(0xFF6B7280);
    const loadingTextColor = Color(0xFF9CA3AF);
    const trackColor = Color(0xFFE5E7EB);

    return BlocListener<SplashViewModel, SplashState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == SplashStatus.completed,
      listener: (context, state) {
        context.go(AppRoutes.login);
      },
      child: Scaffold(
        backgroundColor: EventlyColors.background,
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon Container
                      Container(
                        width: 104,
                        height: 104,
                        decoration: BoxDecoration(
                          color: const Color(0x0DFF4040), // rgba(255, 64, 64, 0.05)
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color(0x26FF4040), // rgba(255, 64, 64, 0.15)
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CustomPaint(
                              painter: _ZapIconPainter(color: primaryRed),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Title
                      const Text(
                        'E V E N T L Y',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: darkTitleColor,
                          letterSpacing: 2.0,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      // Subtitle
                      const SizedBox(
                        width: 220,
                        child: Text(
                          'Manage your event business in one place.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: subtitleColor,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                // Loading Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Progress Bar Container
                      Container(
                        width: 160,
                        height: 3,
                        decoration: BoxDecoration(
                          color: trackColor,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: BlocBuilder<SplashViewModel, SplashState>(
                          buildWhen: (p, c) => p.progress != c.progress,
                          builder: (context, state) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.easeInOut,
                                width: 160 * state.progress.clamp(0.0, 1.0),
                                height: 3,
                                color: primaryRed,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: loadingTextColor,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ),
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
      ..strokeWidth = size.width * (1.2 / 24)
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
