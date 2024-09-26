import 'package:flutter/material.dart';
import 'package:inheritedwidget/view/color_item.dart';

class ChangeColorScreen extends StatelessWidget {
  const ChangeColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MaterialColor> availableColors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.amber,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Color'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: availableColors
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ColorItem(
                      color: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
