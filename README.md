# 90's Baby Finance App

A financial education app designed for millennials and young professionals.

## Features

- Financial courses on topics like 401k, investing, interest rates, etc.
- Progress tracking for completed courses
- Community section for discussing financial topics
- Achievement system for completing learning milestones

## Setup and Development

### Prerequisites

- Flutter 3.19+ (latest stable)
- Dart SDK 3.7+
- Xcode 14+ (for iOS development)
- Chrome (for web development)
- VS Code with Flutter extension (recommended)

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/nineties_baby_finance.git
   cd nineties_baby_finance
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app (choose one):
   ```bash
   # For iOS Simulator
   flutter run -d iphone
   
   # For Chrome
   flutter run -d chrome
   
   # Or use VS Code launch configurations
   ```

### VS Code Setup

This project includes VS Code configuration files for easy development:

- **launch.json**: Contains launch configurations for running on Chrome and iOS Simulator
- **settings.json**: Sets up Flutter-specific VS Code settings
- **tasks.json**: Provides custom tasks for common Flutter operations

To run or debug the app in VS Code:
1. Open the project in VS Code
2. Press F5 or click the "Run" button
3. Select one of the provided launch configurations:
   - Chrome
   - iOS Simulator
   - nineties_baby_finance (debug mode)

### Building for Production

#### Web
```bash
flutter build web --release
```

#### iOS
```bash
flutter build ios --release
```

## Project Structure

- **lib/models/**: Data models
- **lib/providers/**: State management using Riverpod
- **lib/screens/**: App screens
- **lib/services/**: Backend services
- **lib/widgets/**: Reusable UI components

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
