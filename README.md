# 🛡️ Alalamia Admin Panel

A comprehensive Flutter-based admin panel for managing orders, statistics, and business operations. Built with modern Flutter architecture patterns and Firebase integration.

![Flutter](https://img.shields.io/badge/Flutter-3.7.0+-blue.svg)
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

- **Multi-language Support**: Arabic (primary) and English localization
- **Real-time Updates**: Firebase integration for live data synchronization
- **Offline Support**: Local storage with Hive for offline functionality
- **Push Notifications**: Firebase messaging for instant updates
- **Modern UI**: Material Design 3 with custom theming and dark mode support
- **Responsive Design**: Adaptive layouts for different screen sizes

### 🔧 Advanced Capabilities

- **State Management**: BLoC/Cubit pattern for predictable state management
- **Pagination**: Infinite scroll pagination for large datasets
- **Search & Filtering**: Advanced search and filtering capabilities
- **Data Visualization**: Interactive charts and statistical representations
- **PDF Generation**: Invoice and report generation with PDF export
- **Secure Storage**: Encrypted local storage for sensitive data

## 🏗️ Architecture

### Project Structure

```
lib/
├── core/                           # Core utilities and shared components
│   ├── config/                     # App configuration
│   ├── data/                       # Data models and result handling
│   ├── di/                         # Dependency injection
│   ├── env/                        # Environment configuration
│   ├── firebase/                   # Firebase services
│   ├── localization/               # Multi-language support
│   ├── networking/                 # API services and networking
│   ├── notifications/              # Push notification handling
│   ├── router/                     # App routing configuration
│   ├── themes/                     # UI themes and styling
│   └── widgets/                    # Reusable UI components
├── modules/                        # Feature modules
│   ├── auth/                       # Authentication system
│   ├── orders/                     # Order management
│   ├── invoice/                    # Invoice handling
│   ├── statistics/                 # Analytics dashboard
│   ├── settings/                   # Admin settings
│   └── splash/                     # App initialization
└── firebase_options.dart          # Firebase configuration
```

### Tech Stack

- **Frontend**: Flutter 3.7.0+
- **State Management**: BLoC/Cubit
- **Backend**: Firebase (Firestore, Authentication, Cloud Messaging)
- **Local Storage**: Hive + Secure Storage
- **Networking**: Dio with Retrofit
- **UI Components**: Material Design 3, Syncfusion Widgets
- **Charts**: Syncfusion Flutter Gauges
- **Navigation**: Auto Route
- **PDF**: Syncfusion PDF Viewer
- **Internationalization**: Flutter Intl

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.7.0 or higher)
- Dart SDK (3.7.0 or higher)
- Android Studio / VS Code
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
   - Add Android and iOS apps to your Firebase project
   - Download and place configuration files:
     - `google-services.json` in `android/app/`
     - `GoogleService-Info.plist` in `ios/Runner/`

4. **Environment Configuration**

   - Copy `.env.example` to `.env` (if exists)
   - Configure your environment variables

5. **Code Generation**

   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

#### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

#### iOS

```bash
flutter build ios --release
```

## 🔧 Configuration

### Firebase Services

- **Firestore**: Database for orders, statistics, and user data
- **Authentication**: Admin user authentication
- **Cloud Messaging**: Push notifications
- **Crashlytics**: Error tracking and reporting

### Environment Variables

Create a `.env` file in the root directory:

```env
API_BASE_URL=your_api_base_url
FIREBASE_PROJECT_ID=your_firebase_project_id
```

### Localization

The app supports Arabic (primary) and English. To add new languages:

1. Add new `.arb` files in `lib/core/localization/l10n/`
2. Run `flutter packages pub run intl_utils:generate`

## 📊 Features Overview

### Order Management

- View all orders with pagination
- Advanced search and filtering
- Real-time status updates
- Order details with customer information
- Status change capabilities

### Statistics Dashboard

- Total orders overview
- Order status distribution
- Interactive gauges and charts
- Real-time data updates
- Export capabilities

### Invoice System

- PDF generation for invoices
- Invoice sharing functionality
- Template customization
- Print support

### Admin Panel

- Secure authentication
- User profile management
- App settings configuration
- Theme and language preferences

## 🧪 Testing

Run the test suite:

```bash
flutter test
```

For integration tests:

```bash
flutter drive --target=test_driver/app.dart
```

## 📱 Deployment

### Android

1. Build the APK or App Bundle
2. Upload to Google Play Console
3. Configure release management

### iOS

1. Build for iOS
2. Archive in Xcode
3. Upload to App Store Connect

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is private and proprietary. All rights reserved.

## 🆘 Support

For support and questions:

- Create an issue in this repository
- Contact the development team
- Check the documentation in the `docs/` folder (if available)

## 🔄 Version History

- **v1.2.0+5** - Current release with enhanced features
- **v1.1.x** - Previous stable releases
- **v1.0.x** - Initial release

---

**Built with ❤️ using Flutter**
