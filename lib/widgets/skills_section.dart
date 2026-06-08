import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    _SkillData(
      emoji: '📱',
      title: 'Mobile & Web',
      color: Color(0x267B6EF6),
      tags: ['Flutter', 'Dart', 'Flutter Web', 'Android', 'iOS'],
    ),
    _SkillData(
      emoji: '🏗',
      title: 'Architecture & State',
      color: Color(0x262DD4BF),
      tags: [
        'MVVM',
        'MVC',
        'Clean Architecture',
        'Bloc',
        'Provider',
        'GetX',
        'Riverpod'
      ],
    ),
    _SkillData(
      emoji: '⚡',
      title: 'Backend & Integration',
      color: Color(0x26F59E0B),
      tags: [
        'REST APIs',
        'GraphQL',
        'WebSockets',
        'Dio',
        'Firebase',
        'Crashlytics'
      ],
    ),
    _SkillData(
      emoji: '📊',
      title: 'Data & Visualization',
      color: Color(0x26A855F7),
      tags: [
        'Dashboards',
        'Charts',
        'KPIs',
        'Analytics',
        'Data Tables',
      ],
    ),
    _SkillData(
      emoji: '💾',
      title: 'Local Storage & DB',
      color: Color(0x262DD4BF),
      tags: ['SQLite', 'Drift', 'Hive', 'SharedPreferences', 'Secure Storage'],
    ),
    _SkillData(
      emoji: '🛠',
      title: 'Tools & Deployment',
      color: Color(0x267B6EF6),
      tags: [
        'Git / GitHub',
        'Figma',
        'Azure',
        'Apache',
        'Play Store',
        'App Store'
      ],
    ),
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
            key: const ValueKey('skills-tag'),
            child: const SectionTag('// capabilities'),
          ),
          const SizedBox(height: 12),
          FadeInOnScroll(
            key: const ValueKey('skills-title'),
            child: const SectionTitle('Technical Skills'),
          ),
          const SizedBox(height: 40),
          FadeInOnScroll(
            key: const ValueKey('skills-grid'),
            child: _SkillsGrid(skills: _skills),
          ),
        ],
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  final List<_SkillData> skills;
  const _SkillsGrid({required this.skills});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 600 ? 1 : (w < 900 ? 2 : 3);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _buildGrid(cols),
      ),
    );
  }

  Widget _buildGrid(int cols) {
    final rows = <List<_SkillData>>[];
    for (var i = 0; i < skills.length; i += cols) {
      rows.add(skills.sublist(i, (i + cols).clamp(0, skills.length)));
    }

    return Column(
      children: rows.asMap().entries.map((rowEntry) {
        final isLastRow = rowEntry.key == rows.length - 1;
        return Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: rowEntry.value.asMap().entries.map((entry) {
                  final isLast = entry.key == rowEntry.value.length - 1;
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: isLast
                              ? BorderSide.none
                              : const BorderSide(color: AppColors.border),
                        ),
                      ),
                      child: _SkillCard(data: entry.value),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (!isLastRow) const AppDivider(),
          ],
        );
      }).toList(),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final _SkillData data;
  const _SkillCard({required this.data});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        color: _hovered ? AppColors.surface2 : AppColors.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: widget.data.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(widget.data.emoji,
                    style: const TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.data.title,
              style: AppTextStyles.syne(
                size: 14,
                weight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.data.tags.map((t) => SkillChip(t)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillData {
  final String emoji;
  final String title;
  final Color color;
  final List<String> tags;

  const _SkillData({
    required this.emoji,
    required this.title,
    required this.color,
    required this.tags,
  });
}
