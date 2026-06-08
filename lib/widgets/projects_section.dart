import 'package:flutter/material.dart';
import '../models/data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            key: const ValueKey('proj-tag'),
            child: const SectionTag('// shipped products'),
          ),
          const SizedBox(height: 12),
          FadeInOnScroll(
            key: const ValueKey('proj-title'),
            child: const SectionTitle('Projects'),
          ),
          const SizedBox(height: 40),
          FadeInOnScroll(
            key: const ValueKey('proj-grid'),
            child: const _ProjectsGrid(),
          ),
        ],
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  const _ProjectsGrid();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 600 ? 1 : (w < 1000 ? 2 : 3);

    final rows = <List<ProjectModel>>[];
    for (var i = 0; i < projects.length; i += cols) {
      rows.add(projects.sublist(i, (i + cols).clamp(0, projects.length)));
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
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
                          child: _ProjectCard(project: entry.value),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                if (!isLastRow) const AppDivider(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
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
            Row(
              children: [
                Text(
                  widget.project.number,
                  style: AppTextStyles.dmMono(
                    size: 10,
                    color: AppColors.textMuted,
                    letterSpacing: 0.08,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '/ ${widget.project.category}',
                  style: AppTextStyles.dmMono(
                    size: 10,
                    color: AppColors.textMuted,
                    letterSpacing: 0.08,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              widget.project.name,
              style: AppTextStyles.syne(size: 16, weight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text(
              widget.project.client,
              style: AppTextStyles.dmMono(size: 11, color: AppColors.teal),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                widget.project.description,
                style: AppTextStyles.dmSans(
                  size: 13,
                  color: AppColors.textMuted,
                  height: 1.65,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.project.tags.map((t) => SkillChip(t, isAccent: true)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
