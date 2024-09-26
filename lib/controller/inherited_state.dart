import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inheritedwidget/model/app_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;
  const StateWidget({
    super.key,
    required this.child,
  });

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  var appState = AppState();
  ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Colors.blue);
  void incrementCounter() {
    final newState = appState.copyWith(counter: appState.counter + 1);
    setState(() {
      appState = newState;
    });
  }

  void changeColor(MaterialColor color) {
    final newState = appState.copyWith(color: color);

    setState(() {
      log('Selected color: ${color.toString()}');
      colorNotifier.value = color;
      appState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      appState: appState,
      stateWidget: this,
      child: widget.child,
    );
  }
}

class StateInheritedWidget extends InheritedWidget {
  final AppState appState;
  final _StateWidgetState stateWidget;

  const StateInheritedWidget({
    super.key,
    required super.child,
    required this.appState,
    required this.stateWidget,
  });

  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
      .stateWidget;

  @override
  bool updateShouldNotify(covariant StateInheritedWidget oldWidget) {
    if (oldWidget.stateWidget != stateWidget) {
      log("Update Should Notify");
    }
    return oldWidget.appState != appState;
  }
}
