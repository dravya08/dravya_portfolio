import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/grid_background.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  final _keys = {
    'skills': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Main scroll view
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer for fixed nav
                const SizedBox(height: 70),

                // HERO
                GridBackground(
                  child: HeroSection(
                    onViewExperience: () => _scrollTo(_keys['experience']!),
                    onContact: () => _scrollTo(_keys['contact']!),
                  ),
                ),

                // SKILLS
                Container(
                  key: _keys['skills'],
                  child: const SkillsSection(),
                ),

                // EXPERIENCE
                Container(
                  key: _keys['experience'],
                  child: const ExperienceSection(),
                ),

                // PROJECTS
                Container(
                  key: _keys['projects'],
                  child: const ProjectsSection(),
                ),

                // CONTACT
                Container(
                  key: _keys['contact'],
                  child: const ContactSection(),
                ),

                // EDUCATION
                const EducationStrip(),

                // FOOTER
                const AppFooter(),
              ],
            ),
          ),

          // Fixed NAV on top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollController,
              sectionKeys: _keys,
            ),
          ),
        ],
      ),
    );
  }
}
