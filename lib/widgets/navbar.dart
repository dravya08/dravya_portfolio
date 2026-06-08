import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isNarrow ? 20 : 64,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: AppColors.bg.withOpacity(0.85),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          // Logo
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'DG',
                  style: AppTextStyles.syne(
                    size: 18,
                    weight: FontWeight.w800,
                    letterSpacing: -0.02,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: AppTextStyles.syne(
                    size: 18,
                    weight: FontWeight.w800,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (!isNarrow) ...[
            _NavLink('Skills', () => _scrollTo(sectionKeys['skills']!)),
            const SizedBox(width: 32),
            _NavLink('Experience', () => _scrollTo(sectionKeys['experience']!)),
            const SizedBox(width: 32),
            _NavLink('Projects', () => _scrollTo(sectionKeys['projects']!)),
            const SizedBox(width: 32),
            _NavLink('Contact', () => _scrollTo(sectionKeys['contact']!)),
            const SizedBox(width: 32),
          ],
          // CTA button
          _NavCTA(onTap: () => _scrollTo(sectionKeys['contact']!)),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: AppTextStyles.dmSans(
            size: 12,
            color: _hovered ? AppColors.textPrimary : AppColors.textMuted,
            letterSpacing: 0.06,
          ),
          child: Text(widget.label.toUpperCase()),
        ),
      ),
    );
  }
}

class _NavCTA extends StatefulWidget {
  final VoidCallback onTap;
  const _NavCTA({required this.onTap});

  @override
  State<_NavCTA> createState() => _NavCTAState();
}

class _NavCTAState extends State<_NavCTA> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFF6B5EE6) : AppColors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Get in touch',
            style: AppTextStyles.dmSans(
              size: 13,
              weight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
