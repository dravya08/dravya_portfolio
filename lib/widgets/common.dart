import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../theme/app_theme.dart';

// ──────────────────────────────────────────
// FADE-IN ON SCROLL WRAPPER
// ──────────────────────────────────────────
class FadeInOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const FadeInOnScroll({super.key, required this.child, this.delay = Duration.zero});

  @override
  State<FadeInOnScroll> createState() => _FadeInOnScrollState();
}

class _FadeInOnScrollState extends State<FadeInOnScroll> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.key.toString() + widget.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: _visible ? 1.0 : 0.0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 600),
          offset: _visible ? Offset.zero : const Offset(0, 0.08),
          curve: Curves.easeOutCubic,
          child: widget.child,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// SECTION TAG  (// capabilities)
// ──────────────────────────────────────────
class SectionTag extends StatelessWidget {
  final String text;
  const SectionTag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.dmMono(
        size: 12,
        color: AppColors.accent,
        letterSpacing: 0.12,
      ),
    );
  }
}

// ──────────────────────────────────────────
// SECTION TITLE
// ──────────────────────────────────────────
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width < 600 ? 28.0 : 40.0;
    return Text(
      text,
      style: AppTextStyles.syne(
        size: size,
        weight: FontWeight.w700,
        letterSpacing: -0.03,
        height: 1.1,
      ),
    );
  }
}

// ──────────────────────────────────────────
// SKILL TAG CHIP
// ──────────────────────────────────────────
class SkillChip extends StatelessWidget {
  final String label;
  final bool isAccent;
  const SkillChip(this.label, {super.key, this.isAccent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isAccent ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
        border: Border.all(
          color: isAccent ? AppColors.accent.withOpacity(0.3) : AppColors.border2,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: AppTextStyles.dmMono(
          size: 11,
          color: isAccent ? AppColors.accent : AppColors.textMuted,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// PRIMARY BUTTON
// ──────────────────────────────────────────
class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const PrimaryButton({super.key, required this.label, required this.onTap});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFF6B5EE6) : AppColors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.dmSans(
              size: 14,
              weight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// SECONDARY BUTTON
// ──────────────────────────────────────────
class SecondaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const SecondaryButton({super.key, required this.label, required this.onTap});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? AppColors.accent : AppColors.border2,
            ),
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.dmSans(
              size: 14,
              weight: FontWeight.w500,
              color: _hovered ? AppColors.accent : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// DIVIDER
// ──────────────────────────────────────────
class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.border, thickness: 1, height: 1);
  }
}
