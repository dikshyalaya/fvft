import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void pop(value) {
    return navigatorKey.currentState!.pop(value);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  void popUntil(String desiredRoute) {
    return navigatorKey.currentState!.popUntil((route) {
      return route.settings.name == desiredRoute;
    });
  }

  Future pushNamedAndRemoveUntil(route, popToInitial) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => popToInitial,
    );
  }

  Future pushReplacementNamedWithArgs(String desiredRoute,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(desiredRoute, arguments: arguments);
  }

  Future pushReplacementNamed(String desiredRoute, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(desiredRoute, arguments: arguments);
  }

  NavigatorState? getNavigationState() {
    return navigatorKey.currentState;
  }

  BuildContext getNavigationContext() {
    return navigatorKey.currentState!.context;
  }

  void popDialog(value) {
    return navigatorKey.currentState!.pop(value);
  }
}
