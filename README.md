# Dravya Gohil — Flutter Web Portfolio

A production-ready Flutter Web portfolio with dark editorial-tech aesthetic, smooth scroll animations, and fully responsive layout.

## 🚀 Quick Start

### Prerequisites
- Flutter SDK ≥ 3.0.0
- Dart ≥ 3.0.0

### Setup

```bash
# 1. Install dependencies
flutter pub get

# 2. Run on Chrome (development)
flutter run -d chrome

# 3. Build for production
flutter build web --release --web-renderer canvaskit
```

### Deploy to Apache Server

```bash
# After building, copy the build/web folder to your Apache server
cp -r build/web/* /var/www/html/

# Or use scp to remote server
scp -r build/web/* user@your-server.com:/var/www/html/
```

---

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── theme/
│   └── app_theme.dart           # Colors, text styles, theme
├── models/
│   └── data.dart                # All portfolio content (experiences, projects)
├── screens/
│   └── home_screen.dart         # Main screen with scroll + nav logic
└── widgets/
    ├── common.dart              # FadeInOnScroll, buttons, chips, dividers
    ├── navbar.dart              # Fixed top navigation bar
    ├── hero_section.dart        # Hero with name, title, stats
    ├── skills_section.dart      # Skills grid cards
    ├── experience_section.dart  # Experience timeline
    ├── projects_section.dart    # Project cards grid
    ├── contact_section.dart     # Contact rows + education + footer
    └── grid_background.dart     # Decorative grid + glow for hero
web/
└── index.html                   # Web entry with loading screen
```

---

## ✏️ Customizing Content

All content lives in **`lib/models/data.dart`**:

### Update Experience
```dart
const List<ExperienceModel> experiences = [
  ExperienceModel(
    period: 'Aug 2024 – Present',
    company: 'Your Company',
    title: 'Your Role',
    client: 'Client Name',            // optional
    bullets: ['Achievement 1', ...],
  ),
  ...
];
```

### Update Projects
```dart
const List<ProjectModel> projects = [
  ProjectModel(
    number: '01',
    category: 'Category',
    name: 'Project Name',
    client: 'Client Name',
    description: 'Description...',
    tags: ['Flutter', 'Bloc'],
  ),
  ...
];
```

### Update Contact Links
Edit `lib/widgets/contact_section.dart` — update the `_contacts` list with your real LinkedIn URL.

---

## 🎨 Design System

| Token | Value |
|---|---|
| Background | `#0A0A0F` |
| Surface | `#111118` |
| Accent | `#7B6EF6` (violet) |
| Teal | `#2DD4BF` |
| Display Font | Syne (Google Fonts) |
| Body Font | DM Sans (Google Fonts) |
| Mono Font | DM Mono (Google Fonts) |

---

## 📦 Key Dependencies

| Package | Purpose |
|---|---|
| `google_fonts` | Syne, DM Sans, DM Mono |
| `flutter_animate` | Entrance animations |
| `visibility_detector` | Scroll-triggered fade-ins |
| `url_launcher` | Open email/phone/LinkedIn links |

---

## 🌐 Production Tips

- Use **CanvasKit** renderer for best visual quality: `--web-renderer canvaskit`
- Enable **gzip compression** on Apache for faster loads
- Add a `.htaccess` for SPA routing if needed:
  ```apache
  RewriteEngine On
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteRule ^ index.html [QSA,L]
  ```
