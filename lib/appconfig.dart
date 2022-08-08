import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String? appTitle;
  final String? buildFlavor;
  @override
  final Widget child;

  const AppConfig(
      {Key? key,
      required this.child,
      required this.appTitle,
      required this.buildFlavor})
      : super(child: child, key: key);

  static AppConfig? of(BuildContext buildContext) {
    return buildContext.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}
