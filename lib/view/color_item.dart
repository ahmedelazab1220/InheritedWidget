import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inheritedwidget/controller/inherited_state.dart';

class ColorItem extends StatelessWidget {
  final MaterialColor color;
  const ColorItem({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var state = StateInheritedWidget.of(context);
    return InkWell(
      onTap: () {
        log('Selected color: ${color.toString()}');
        state.changeColor(color);
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
    );
  }
}
