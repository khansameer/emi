import 'package:flutter/material.dart';

class ThemeChangerWidget extends StatefulWidget {
  final Widget child;

  ThemeChangerWidget({required this.child});

  @override
  _ThemeChangerWidgetState createState() => _ThemeChangerWidgetState();

  static _ThemeChangerWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeChangerWidgetState>()!;
  }
}

class _ThemeChangerWidgetState extends State<ThemeChangerWidget> {
  ThemeData _currentTheme = ThemeData.light();

  void changeTheme() {
    setState(() {
      if (_currentTheme == ThemeData.light()) {
        _currentTheme = ThemeData.dark();
      } else {
        _currentTheme = ThemeData.light();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _currentTheme,
      home: widget.child,
    );
  }
}
