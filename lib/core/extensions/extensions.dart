import 'package:flutter/material.dart';

extension StringExtension on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get capitalizeFirstofEach {
    return split(" ").map((str) => str.capitalize).join(" ");
  }
}

extension PushNamed on BuildContext {
  void pushNamed(
    String route, {
    Object? arguments,
  }) {
    Navigator.pushNamed(
      this,
      route,
      arguments: {
        "data": arguments,
      },
    );
  }
}

extension Pop on BuildContext {
  void pop() {
    Navigator.pop(this);
  }
}

extension PushReplacement on BuildContext {
  void pushReplacementNamed(String route) {
    Navigator.pushReplacementNamed(this, route);
  }
}

extension PushAndRemoveUntil on BuildContext {
  void pushNamedAndRemoveUntil(String route) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      route,
      (route) => false,
    );
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }
}

extension SizeExtension on BuildContext {
  Size get size {
    return MediaQuery.of(this).size;
  }
}

extension WidthExtension on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }
}

extension HeightExtension on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

extension FucusOff on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}

extension GetArgs on BuildContext {
  T getArgs<T>() {
    final data =
        ModalRoute.of(this)!.settings.arguments as Map<String, dynamic>;
    return data["data"] as T;
  }
}

extension OrientationExtension on BuildContext {
  Orientation get orientation {
    return MediaQuery.of(this).orientation;
  }
}

extension Calculator on BuildContext {
  double heightCalculated(double height) {
    return height * MediaQuery.of(this).size.height / 852;
  }

  double widthCalculated(double width) {
    return width * MediaQuery.of(this).size.width / 393;
  }
}
