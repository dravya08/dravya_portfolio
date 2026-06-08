import 'package:flutter/material.dart';

class ExperienceModel {
  final String period;
  final String company;
  final String title;
  final String? client;
  final List<String> bullets;

  const ExperienceModel({
    required this.period,
    required this.company,
    required this.title,
    this.client,
    required this.bullets,
  });
}

class ProjectModel {
  final String number;
  final String category;
  final String name;
  final String client;
  final String description;
  final List<String> tags;

  const ProjectModel({
    required this.number,
    required this.category,
    required this.name,
    required this.client,
    required this.description,
    required this.tags,
  });
}

class SkillCategory {
  final String icon;
  final String title;
  final List<String> tags;
  final Color iconBg;

  const SkillCategory({
    required this.icon,
    required this.title,
    required this.tags,
    required this.iconBg,
  });
}

const List<ExperienceModel> experiences = [
  ExperienceModel(
    period: 'Aug 2024 – Present',
    company: 'Exponentia.ai',
    title: 'Software Engineer',
    client: 'Client: Adani Logistics',
    bullets: [
      'Leading development of enterprise analytics dashboards for logistics and business intelligence on Flutter Web.',
      'Building highly interactive data visualization solutions with charts, KPIs, filters, and analytical tables.',
      'Designing scalable reusable widget systems with optimized rendering performance.',
      'Partnering with backend teams to design APIs for high-performance analytical use cases.',
      'Managing full deployment lifecycle on Apache Server; working cross-functionally with Exponentia.ai and PwC teams.',
    ],
  ),
  ExperienceModel(
    period: 'Nov 2023 – Jun 2024',
    company: 'SYSTECX',
    title: 'Senior Flutter Developer',
    client: 'Client: Rescom Holdings',
    bullets: [
      'Led development of a Trade Management System (TMS) accommodating multi-company workflows.',
      'Delivered features including flexible invoicing, workflow automation, user management, and meeting/tour management.',
      'Migrated existing web workflows into a cross-platform mobile Flutter application.',
      'Developed responsive, reusable Flutter UI components from Figma designs.',
    ],
  ),
  ExperienceModel(
    period: 'Nov 2021 – Nov 2023',
    company: 'CDP India Pvt. Ltd.',
    title: 'Junior Software Developer',
    client: 'Multiple Enterprise Clients',
    bullets: [
      'Developed and maintained 5 production applications across CRM, attendance, logistics, insurance, and visitor management.',
      'Integrated Firebase Crashlytics and Analytics for crash monitoring and user behavior tracking.',
      'Implemented real-time employee location tracking, geofencing, and offline attendance sync logic.',
      'Deployed applications to Google Play Store and Apple App Store across multiple client accounts.',
      'Conducted R&D for innovative features; participated in Agile sprint planning.',
    ],
  ),
];

const List<ProjectModel> projects = [
  ProjectModel(
    number: '01',
    category: 'Enterprise Dashboard',
    name: 'Adani Logistics Analytics',
    client: 'Exponentia.ai × Adani Group',
    description:
        'Enterprise-grade analytics dashboards for logistics and BI operations. Interactive data visualization with charts, KPIs, and analytical tables deployed on Apache Server.',
    tags: ['Flutter Web', 'Provider', 'Data Viz', 'Apache'],
  ),
  ProjectModel(
    number: '02',
    category: 'Trade Platform',
    name: 'Trade Management System',
    client: 'SYSTECX × Rescom Holdings',
    description:
        'Robust TMS platform for multi-company management with flexible invoicing, workflow automation, user management, and meeting and tour management.',
    tags: ['Flutter', 'MVVM', 'REST APIs', 'Riverpod'],
  ),
  ProjectModel(
    number: '03',
    category: 'CRM Application',
    name: 'Walplast CRM App',
    client: 'CDP India × Walplast',
    description:
        'Full-featured CRM for Sales Teams, Distributors, and Retailers with real-time location tracking, coupon scanning, credit note management, and product offers.',
    tags: ['Flutter', 'Firebase', 'Live Tracking'],
  ),
  ProjectModel(
    number: '04',
    category: 'SaaS Attendance',
    name: 'CDP EAS',
    client: 'CDP India Pvt. Ltd.',
    description:
        'Attendance SaaS with face recognition, geofencing, real-time tracking, leave management, kiosk mode, and comprehensive job reporting for sales personnel.',
    tags: ['Flutter', 'Geofencing', 'Crashlytics', 'Kiosk Mode'],
  ),
  ProjectModel(
    number: '05',
    category: 'Metro Attendance',
    name: 'MMMOCL EAS',
    client: 'Maha Mumbai Metro',
    description:
        'Attendance system for MMMOCL staff with real-time manager dashboard, shift-based attendance, offline sync, leave management, and live accountability tracking.',
    tags: ['Flutter', 'Offline Sync', 'Shift Logic'],
  ),
  ProjectModel(
    number: '06',
    category: 'Insurance & Safety',
    name: 'Tata AIG Suraksha',
    client: 'Tata AIG General Insurance',
    description:
        'Road safety app managing employee licenses, vehicles, insurance records, and journey tracking. Calculates distance, speed, and generates travel summaries with SOS support.',
    tags: ['Flutter', 'GPS Tracking', 'SOS', 'Vehicle Tracking'],
  ),
];
