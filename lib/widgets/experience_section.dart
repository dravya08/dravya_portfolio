import 'package:flutter/material.dart';
import '../models/data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    final hPad = isNarrow ? 24.0 : 64.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInOnScroll(
            key: const ValueKey('exp-tag'),
            child: const SectionTag('// work history'),
          ),
          const SizedBox(height: 12),
          FadeInOnScroll(
            key: const ValueKey('exp-title'),
            child: const SectionTitle('Experience'),
          ),
          const SizedBox(height: 40),
          const AppDivider(),
          ...experiences.asMap().entries.map(
                (e) => FadeInOnScroll(
                  key: ValueKey('exp-${e.key}'),
                  child: _ExperienceItem(exp: e.value),
                ),
              ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final ExperienceModel exp;
  const _ExperienceItem({required this.exp});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;

    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: isNarrow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ExpMeta(exp: exp),
                const SizedBox(height: 16),
                _ExpBody(exp: exp),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 200, child: _ExpMeta(exp: exp)),
                const SizedBox(width: 32),
                Expanded(child: _ExpBody(exp: exp)),
              ],
            ),
    );

    return Column(
      children: [
        content,
        const AppDivider(),
      ],
    );
  }
}

class _ExpMeta extends StatelessWidget {
  final ExperienceModel exp;
  const _ExpMeta({required this.exp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exp.period,
          style: AppTextStyles.dmMono(size: 11, letterSpacing: 0.04),
        ),
        const SizedBox(height: 6),
        Text(
          exp.company,
          style: AppTextStyles.dmSans(size: 13, color: AppColors.textMuted),
        ),
      ],
    );
  }
}

class _ExpBody extends StatelessWidget {
  final ExperienceModel exp;
  const _ExpBody({required this.exp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exp.title,
          style: AppTextStyles.syne(size: 20, weight: FontWeight.w700),
        ),
        if (exp.client != null) ...[
          const SizedBox(height: 6),
          Text(
            '→ ${exp.client}',
            style: AppTextStyles.dmMono(size: 12, color: AppColors.teal),
          ),
        ],
        const SizedBox(height: 16),
        ...exp.bullets.map(
          (b) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3, right: 10),
                  child: Text(
                    '→',
                    style: AppTextStyles.dmSans(
                      size: 12,
                      color: AppColors.accent,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    b,
                    style: AppTextStyles.dmSans(
                      size: 14,
                      color: AppColors.textMuted,
                      height: 1.65,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
