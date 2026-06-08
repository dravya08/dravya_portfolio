import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border
      ..strokeWidth = 1;

    const step = 60.0;

    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GridBackground extends StatelessWidget {
  final Widget child;
  const GridBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ShaderMask(
            shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.center,
              radius: 0.7,
              colors: [Colors.black, Colors.transparent],
            ).createShader(bounds),
            blendMode: BlendMode.dstIn,
            child: CustomPaint(painter: GridBackgroundPainter()),
          ),
        ),
        // Accent glow
        Positioned(
          top: -200,
          right: -100,
          child: Container(
            width: 700,
            height: 700,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accent.withOpacity(0.12),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
