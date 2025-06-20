# 🛡️ Alalamia Admin Panel

A comprehensive Flutter-based admin panel for managing orders, statistics, and business operations. Built with modern Flutter architecture patterns and Firebase integration.

![Flutter](https://img.shields.io/badge/Flutter-3.7.0+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.7.0+-blue.svg)
![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange.svg)
![Version](https://img.shields.io/badge/Version-1.2.0+5-green.svg)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey.svg)

## 📱 Features

### 🎯 Core Functionality

- **Order Management**: View, filter, search, and manage orders with real-time updates
- **Order Status Tracking**: Multi-stage order status management (Review → Approved → Preparing → On the Way → Delivered)
- **Statistics Dashboard**: Real-time analytics with interactive charts and gauges
- **Invoice Management**: Generate and manage PDF invoices with sharing capabilities
- **Admin Authentication**: Secure login system for administrative access

### 🌐 Technical Features

- **Multi-language Support**: Arabic (primary) and English localization with `flutter_intl`
- **Real-time Updates**: Firebase integration for live data synchronization
- **Offline Support**: Local storage with HiveCE for offline functionality
- **Push Notifications**: Firebase Cloud Messaging for instant updates
- **Modern UI**: Material Design 3 with custom theming and responsive design
- **Adaptive Layouts**: Screen size adaptation with `flutter_screenutil`

### 🔧 Advanced Capabilities

- **State Management**: BLoC/Cubit pattern with `flutter_bloc` and `hydrated_bloc`
- **Pagination**: Infinite scroll pagination for large datasets
- **Search & Filtering**: Advanced search and filtering capabilities
- **Data Visualization**: Interactive charts with Syncfusion Flutter Gauges
- **PDF Generation**: Invoice and report generation with `pdf` and `syncfusion_flutter_pdfviewer`
- **Secure Storage**: Encrypted local storage with `flutter_secure_storage`
- **Environment Management**: Secure environment variables with `envied`

## 🏗️ Architecture

### Project Structure

```
lib/
├── core/                           # Core utilities and shared components
│   ├── config/                     # App configuration with Cubit
│   ├── data/                       # Data models and result handling
│   ├── di/                         # Dependency injection with GetIt
│   ├── env/                        # Environment configuration with Envied
│   ├── errors/                     # Error handling and custom exceptions
│   ├── extension/                  # Dart extensions
│   ├── firebase/                   # Firebase services
│   ├── local_storage/              # HiveCE local storage management
│   ├── localization/               # Multi-language support with Flutter Intl
│   ├── models/                     # Core data models
│   ├── networking/                 # API services with Dio and Retrofit
│   ├── notifications/              # FCM and in-app notifications
│   ├── router/                     # App routing with AutoRoute
│   ├── themes/                     # UI themes and styling
│   ├── utils/                      # Utility functions and helpers
│   └── widgets/                    # Reusable UI components
├── modules/                        # Feature modules
│   ├── auth/                       # Authentication system
│   │   └── sign_in/               # Sign-in functionality
│   ├── invoice/                    # Invoice management with PDF generation
│   ├── main/                       # Main app navigation and layout
│   ├── order_details/              # Detailed order management
│   ├── orders/                     # Orders listing and filtering
│   ├── settings/                   # Admin settings and preferences
│   ├── splash/                     # App initialization
│   └── statistics/                 # Analytics dashboard
├── firebase_options.dart          # Firebase configuration
└── hive_registrar.g.dart         # HiveCE type adapters
```

### Tech Stack

#### Core Framework

- **Flutter**: 3.7.0+ with Dart 3.7.0+
- **State Management**: flutter_bloc (^9.1.1), hydrated_bloc (^10.0.0)
- **Dependency Injection**: get_it (^8.0.3)

#### Backend & Data

- **Firebase**:
  - Core (^3.13.0)
  - Cloud Messaging (^15.2.5)
  - Crashlytics (^4.3.5)
- **Local Storage**: hive_ce (^2.10.1), flutter_secure_storage (^9.2.4)
- **Networking**: dio (^5.8.0+1), retrofit (^4.4.2)

#### UI & UX

- **UI Framework**: Material Design 3, flutter_screenutil (^5.9.3)
- **Charts**: syncfusion_flutter_gauges (^29.1.38)
- **Navigation**: auto_route (^10.0.1), salomon_bottom_bar (^3.3.2)
- **Loading States**: skeletonizer (^2.0.1), flutter_easyloading (^3.0.5)
- **Pagination**: infinite_scroll_pagination (^5.0.0)

#### Features

- **PDF**: pdf (^3.11.3), syncfusion_flutter_pdfviewer (^29.1.38)
- **Internationalization**: flutter_localizations, intl_utils (^2.8.10)
- **Icons & Graphics**: flutter_svg (^2.0.17), flutter_initicon (^3.0.1)
- **Utilities**: jiffy (^6.3.2), package_info_plus (^8.3.0), share_plus (^11.0.0)

#### Development Tools

- **Code Generation**: freezed (^2.5.8), json_serializable (^6.9.5)
- **Environment**: envied (^1.1.1)
- **Debugging**: pretty_dio_logger (^1.4.0), logger (^2.5.0)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.7.0 or higher)
- Dart SDK (3.7.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Firebase account and project setup
- Git

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd alalamia_admin
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable the following services:
     - Firestore Database
     - Authentication
     - Cloud Messaging
     - Crashlytics
   - Add Android and iOS apps to your Firebase project
   - Download and place configuration files:
     - `google-services.json` in `android/app/`
     - `GoogleService-Info.plist` in `ios/Runner/`

4. **Environment Configuration**

   Create environment files for different build configurations:

   ```bash
   # Create .env files based on your environment needs
   # The project uses envied for secure environment variable management
   ```

5. **Code Generation**

   Generate required files for models, routes, and environment variables:

   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

6. **Internationalization Setup**

   Generate localization files:

   ```bash
   flutter packages pub run intl_utils:generate
   ```

7. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

#### Android

```bash
# APK
flutter build apk --release

# App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS

```bash
flutter build ios --release
```

## 🔧 Configuration

### Firebase Services Configuration

#### Firestore Database

- **Collections**: Orders, Users, Statistics, Settings
- **Security Rules**: Configure based on admin access requirements
- **Indexes**: Set up composite indexes for complex queries

#### Authentication

- **Providers**: Email/Password for admin accounts
- **Security**: Admin-only access with custom claims

#### Cloud Messaging

- **Topics**: Order updates, system notifications
- **Targeting**: Admin devices only

#### Crashlytics

- **Error Tracking**: Automatic crash reporting
- **Custom Events**: Business logic error tracking

### Environment Variables

The project uses `envied` for secure environment variable management:

```dart
// lib/core/env/env.dart
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'FIREBASE_PROJECT_ID')
  static const String firebaseProjectId = _Env.firebaseProjectId;
}
```

### Local Storage Configuration

The app uses HiveCE for local storage with the following adapters:

- **User Credentials**: Secure storage of authentication tokens
- **App Settings**: User preferences and configuration
- **Cached Data**: Offline support for critical data

### Localization Configuration

Located in `lib/core/localization/l10n/`:

- **Arabic (ar)**: Primary language - `intl_ar.arb`
- **English (en)**: Secondary language - `intl_en.arb`

To add new languages:

1. Create new `.arb` file in `lib/core/localization/l10n/`
2. Add translations
3. Run `flutter packages pub run intl_utils:generate`
4. Update `main_locale` in `pubspec.yaml` if needed

## 📊 Features Overview

### Order Management System

- **Real-time Order Updates**: Live synchronization with Firebase
- **Advanced Filtering**: Filter by status, date, customer, amount
- **Search Functionality**: Quick search across order details
- **Status Management**: Update order status with workflow validation
- **Pagination**: Efficient loading of large order datasets

### Statistics Dashboard

- **Interactive Gauges**: Syncfusion gauges for visual data representation
- **Real-time Metrics**: Live statistics updates
- **Order Analytics**: Status distribution and trends
- **Performance Indicators**: Key business metrics

### Invoice System

- **PDF Generation**: Create professional invoices
- **Template Customization**: Branded invoice templates
- **Sharing Options**: Email, WhatsApp, and file sharing
- **Print Support**: Direct printing capabilities

### Administrative Features

- **Secure Authentication**: Firebase-based admin login
- **User Profile Management**: Admin account settings
- **App Configuration**: System-wide settings management
- **Multi-language Interface**: Arabic and English support

## 🧪 Testing

Run the test suite:

```bash
flutter test
```

For widget tests:

```bash
flutter test test/widget_test/
```

For integration tests:

```bash
flutter test integration_test/
```

## 🔨 Development

### Code Generation

The project uses several code generation tools:

```bash
# Generate all (models, routes, environment, etc.)
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch mode for development
flutter packages pub run build_runner watch --delete-conflicting-outputs

# Clean and rebuild
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Adding New Features

1. **Create Feature Module**: Follow the existing module structure
2. **Implement BLoC/Cubit**: Use the established state management pattern
3. **Add Routes**: Register new routes in `app_router.dart`
4. **Implement Repository**: Create data layer following the pattern
5. **Add Tests**: Include unit and widget tests

### State Management Guidelines

- Use **Cubit** for simple state management
- Use **BLoC** for complex business logic with events
- Implement **HydratedBloc** for state persistence
- Follow the established naming conventions

## 📱 Deployment

### Android Deployment

1. **Prepare Release Build**:

   ```bash
   flutter build appbundle --release
   ```

2. **Upload to Play Console**:
   - Navigate to Google Play Console
   - Upload the AAB file from `build/app/outputs/bundle/release/`
   - Configure release notes and rollout

### iOS Deployment

1. **Prepare Release Build**:

   ```bash
   flutter build ios --release
   ```

2. **Archive in Xcode**:
   - Open `ios/Runner.xcworkspace` in Xcode
   - Archive and upload to App Store Connect

### Fastlane Integration

The project includes Fastlane configuration for automated deployment:

```bash
cd android
fastlane deploy
```

## 🤝 Contributing

### Development Workflow

1. **Fork the repository**
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Follow coding standards**:
   - Use proper naming conventions
   - Add documentation for public APIs
   - Include tests for new features
4. **Commit changes**:
   ```bash
   git commit -m 'feat: add amazing feature'
   ```
5. **Push to branch**:
   ```bash
   git push origin feature/amazing-feature
   ```
6. **Create Pull Request**

### Code Style Guidelines

- Follow Dart conventions and `flutter_lints`
- Use meaningful variable and function names
- Add comments for complex business logic
- Maintain consistent file and folder structure

## 📄 License

This project is private and proprietary. All rights reserved.

## 🆘 Support

For support and questions:

- **Issues**: Create an issue in this repository
- **Documentation**: Check inline code documentation
- **Code Review**: Request review from the development team

## 🔄 Version History

- **v1.2.0+5** - Current release
  - Enhanced statistics dashboard
  - Improved order management
  - Updated dependencies
  - Bug fixes and performance improvements

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [BLoC Library Documentation](https://bloclibrary.dev/)
- [AutoRoute Documentation](https://pub.dev/packages/auto_route)

---

**Built with ❤️ using Flutter and modern development practices**
