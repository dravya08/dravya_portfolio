import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewExperience;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewExperience,
    required this.onContact,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _dotController;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isNarrow = w < 700;
    final hPad = isNarrow ? 24.0 : 64.0;
    final nameSize = isNarrow ? 52.0 : (w < 1000 ? 80.0 : 110.0);
    final titleSize = isNarrow ? 22.0 : 36.0;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 100),
      padding: EdgeInsets.fromLTRB(hPad, 120, hPad, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status badge
          _StatusBadge(controller: _dotController)
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutCubic),

          const SizedBox(height: 28),

          // Name
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFF0EEEE), Color(0xFF7A7A8C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'Dravya\nGohil',
              style: AppTextStyles.syne(
                size: nameSize,
                weight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.04,
                height: 0.95,
              ),
            ),
          )
              .animate(delay: 100.ms)
              .fadeIn(duration: 700.ms)
              .slideY(begin: 0.2, end: 0, duration: 700.ms, curve: Curves.easeOutCubic),

          const SizedBox(height: 16),

          // Title
          Text(
            'Flutter Developer',
            style: AppTextStyles.syne(
              size: titleSize,
              weight: FontWeight.w400,
              color: AppColors.accent,
              letterSpacing: -0.02,
            ),
          )
              .animate(delay: 200.ms)
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutCubic),

          const SizedBox(height: 24),

          // Description
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              '4+ years building scalable mobile and web applications — from enterprise CRM systems and analytics dashboards to logistics platforms. End-to-end, from Figma to production.',
              style: AppTextStyles.dmSans(
                size: 16,
                color: AppColors.textMuted,
                height: 1.75,
              ),
            ),
          )
              .animate(delay: 300.ms)
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutCubic),

          const SizedBox(height: 32),

          // Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PrimaryButton(label: 'View Experience', onTap: widget.onViewExperience),
              SecondaryButton(label: 'Contact Me', onTap: widget.onContact),
            ],
          )
              .animate(delay: 400.ms)
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutCubic),

          const SizedBox(height: 60),

          // Stats
          const AppDivider(),
          const SizedBox(height: 36),
          Wrap(
            spacing: 48,
            runSpacing: 24,
            children: const [
              _StatItem(number: '4+', label: 'Years Experience'),
              _StatItem(number: '7+', label: 'Apps Shipped'),
              _StatItem(number: '10+', label: 'Dashboard Shipped'),
              _StatItem(number: '3', label: 'Companies'),
              _StatItem(number: '2', label: 'Internship '),
            ],
          )
              .animate(delay: 500.ms)
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms, curve: Curves.easeOutCubic),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final AnimationController controller;
  const _StatusBadge({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.1),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (_, __) => Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: AppColors.teal.withOpacity(0.5 + controller.value * 0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Available for new opportunities',
            style: AppTextStyles.dmMono(size: 11, letterSpacing: 0.04),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: AppTextStyles.syne(size: 36, weight: FontWeight.w700, height: 1),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: AppTextStyles.dmSans(
            size: 11,
            color: AppColors.textMuted,
            letterSpacing: 0.08,
          ),
        ),
      ],
    );
  }
}
