
import 'package:flutter/material.dart';

import '../singletons/app_singleton.dart';

Future<dynamic> pushToNextScreen(
    {BuildContext? context,
      required Widget child,
      required String name,
      bool fullscreenDialog = false,
      bool rootNavigator = false,
      Object? arguments}) {
  context = context ??
      SingletonService().key.currentState!.context;
  return Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
          builder: (context) => child,
          fullscreenDialog: fullscreenDialog,
          settings: RouteSettings(name: name, arguments: arguments)));
}

Future<dynamic> pushReplacementToNextScreen(
    {BuildContext? context,
      required Widget child,
      required String name,
      bool fullscreenDialog = false,
      bool rootNavigator = false,
      Object? arguments}) {
  context = context ??
      SingletonService().key.currentState!.context;
  return Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
      MaterialPageRoute(
          builder: (context) => child,
          fullscreenDialog: fullscreenDialog,
          settings: RouteSettings(name: name, arguments: arguments)));
}

popUntil(
    {BuildContext? context, required String name, bool rootNavigator = false}) {
  context = context ??
      SingletonService().key.currentState!.context;
  Navigator.of(context, rootNavigator: rootNavigator)
      .popUntil(ModalRoute.withName(name));
}

pop({BuildContext? context, bool rootNavigator = false, resultToSendBack}) {
  context = context ??
      SingletonService().key.currentState!.context;
  Navigator.of(context, rootNavigator: rootNavigator).pop(resultToSendBack);
}

