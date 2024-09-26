import 'package:flutter/material.dart';

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
  var counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      counter: counter,
      stateWidget: this,
      child: widget.child,
    );
  }
}

class StateInheritedWidget extends InheritedWidget {
  final int counter;
  final _StateWidgetState stateWidget;

  const StateInheritedWidget({
    super.key,
    required super.child,
    this.counter = 0,
    required this.stateWidget,
  });

  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
      .stateWidget;

  @override
  bool updateShouldNotify(covariant StateInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}
