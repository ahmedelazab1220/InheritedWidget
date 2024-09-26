import 'package:flutter/material.dart';

class AppState {
  final int counter;
  final MaterialColor color;

  AppState({this.counter = 0, this.color = Colors.blue});

  AppState copyWith({int? counter, MaterialColor? color}) {
    return AppState(
      counter: counter ?? this.counter,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          color == color;

  @override
  int get hashCode => counter.hashCode ^ color.hashCode;
}
