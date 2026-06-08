import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const _contacts = [
    _ContactData(icon: '📞', label: 'Phone', value: '+91 96190 87034', url: 'tel:+919619087034'),
    _ContactData(
      icon: '✉️',
      label: 'Email',
      value: 'dravyagohil@gmail.com',
      url: 'mailto:dravyagohil@gmail.com',
    ),
    _ContactData(
      icon: '💼',
      label: 'LinkedIn',
      value: 'Connect on LinkedIn',
      url: 'https://linkedin.com/in/dravyagohil',
    ),
    _ContactData(icon: '📍', label: 'Location', value: 'Mumbai, India', url: null),
  ];

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
            key: const ValueKey('contact-tag'),
            child: const SectionTag('// get in touch'),
          ),
          const SizedBox(height: 24),
          isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ContactHeading(),
                    const SizedBox(height: 40),
                    _ContactList(contacts: _contacts),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactHeading()),
                    const SizedBox(width: 64),
                    Expanded(child: _ContactList(contacts: _contacts)),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ContactHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyles.syne(
              size: MediaQuery.of(context).size.width < 700 ? 36 : 52,
              weight: FontWeight.w800,
              letterSpacing: -0.04,
              height: 1.0,
            ),
            children: [
              const TextSpan(text: "Let's build\n"),
              TextSpan(
                text: 'something\n',
                style: AppTextStyles.syne(
                  size: MediaQuery.of(context).size.width < 700 ? 36 : 52,
                  weight: FontWeight.w800,
                  color: AppColors.accent,
                  letterSpacing: -0.04,
                  height: 1.0,
                ),
              ),
              const TextSpan(text: 'great.'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Open to new opportunities — whether that\'s a full-time role, contract work, or an interesting product challenge.',
          style: AppTextStyles.dmSans(
            size: 15,
            color: AppColors.textMuted,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

class _ContactList extends StatelessWidget {
  final List<_ContactData> contacts;
  const _ContactList({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: contacts.map((c) => _ContactRow(data: c)).toList(),
    );
  }
}

class _ContactRow extends StatefulWidget {
  final _ContactData data;
  const _ContactRow({required this.data});

  @override
  State<_ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<_ContactRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.data.url != null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        onEnter: hasUrl ? (_) => setState(() => _hovered = true) : null,
        onExit: hasUrl ? (_) => setState(() => _hovered = false) : null,
        cursor: hasUrl ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: hasUrl
              ? () async {
                  final uri = Uri.parse(widget.data.url!);
                  if (await canLaunchUrl(uri)) launchUrl(uri);
                }
              : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: _hovered ? AppColors.surface2 : AppColors.surface,
              border: Border.all(
                color: _hovered ? AppColors.accent : AppColors.border,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(widget.data.icon, style: const TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.label,
                      style: AppTextStyles.dmSans(size: 11, color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.data.value,
                      style: AppTextStyles.dmSans(size: 14, weight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactData {
  final String icon;
  final String label;
  final String value;
  final String? url;
  const _ContactData({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });
}

// ──────────────────────────────────────────
// EDUCATION STRIP
// ──────────────────────────────────────────
class EducationStrip extends StatelessWidget {
  const EducationStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    final hPad = isNarrow ? 24.0 : 64.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 36),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.border),
        ),
      ),
      child: Wrap(
        spacing: 48,
        runSpacing: 24,
        children: const [
          _EduItem(
            label: 'Education',
            degree: 'BE — Computer Engineering',
            school: 'Universal College of Engineering, Mumbai University',
          ),
          _EduItem(
            label: 'Diploma',
            degree: 'Diploma — Computer Science',
            school: 'Sardar Vallabhbhai Patel Polytechnic, Mumbai',
          ),
        ],
      ),
    );
  }
}

class _EduItem extends StatelessWidget {
  final String label;
  final String degree;
  final String school;
  const _EduItem({required this.label, required this.degree, required this.school});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTextStyles.dmMono(size: 10, letterSpacing: 0.1),
        ),
        const SizedBox(height: 6),
        Text(degree, style: AppTextStyles.syne(size: 15, weight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(
          school,
          style: AppTextStyles.dmSans(size: 13, color: AppColors.textMuted),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────
// FOOTER
// ──────────────────────────────────────────
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    final hPad = isNarrow ? 24.0 : 64.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: isNarrow
          ? Column(
              children: [
                Text(
                  '© 2025 Dravya Gohil. Built with Flutter Web.',
                  style: AppTextStyles.dmSans(size: 12, color: AppColors.textMuted),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2025 Dravya Gohil. Built with Flutter Web.',
                  style: AppTextStyles.dmSans(size: 12, color: AppColors.textMuted),
                ),
                Text(
                  'DG.',
                  style: AppTextStyles.syne(
                    size: 15,
                    weight: FontWeight.w800,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
    );
  }
}
