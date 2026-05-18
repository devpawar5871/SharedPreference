# SharedPreferences Demo 💾

A simple Flutter application demonstrating how to use SharedPreferences for local data storage.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2505f5bc-6ec8-4dd7-b0b4-cda87663eb94" />


---

# Features ✨

- Save data locally
- Retrieve stored data
- Delete saved data
- Simple Flutter UI
- Local storage using SharedPreferences

---

# Tech Stack 🚀

- Flutter
- Dart
- SharedPreferences Package

---

# Installation ⚙️

## 1. Clone Repository

```bash
git clone https://github.com/your-username/sharedpreferences-demo.git
```

## 2. Open Project

```bash
cd sharedpreferences-demo
```

## 3. Install Dependencies

```bash
flutter pub get
```

## 4. Run App

```bash
flutter run
```

---

# Dependencies 📦

Add this in `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.3
```

Install packages:

```bash
flutter pub get
```

---

# Import Package

```dart
import 'package:shared_preferences/shared_preferences.dart';
```

---

# Example Code 💻

## Save Data

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setString('name', 'Dev Pawar');
```

## Get Data

```dart
final prefs = await SharedPreferences.getInstance();
String? name = prefs.getString('name');

print(name);
```

## Delete Data

```dart
await prefs.remove('name');
```

---

# Project Structure 📁

```text
lib/
 ├── main.dart

```

---

# Future Improvements 🔥

- Dark mode
- Better UI design
- Store multiple values
- Add SQLite integration
- User authentication

---

# Author 👨‍💻

Created by Dev Pawar

---

# License 📄

This project is open-source and free to use.
