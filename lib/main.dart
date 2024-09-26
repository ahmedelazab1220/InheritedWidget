import 'package:flutter/material.dart';
import 'package:inheritedwidget/controller/inherited_state.dart';
import 'package:inheritedwidget/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: Builder(
        builder: (context) {
          final state = StateInheritedWidget.of(context);
          return ValueListenableBuilder<Color>(
            valueListenable: state.colorNotifier,
            builder: (context, color, child) {
              var myColorScheme = ColorScheme(
                primary: color,
                secondary: Colors.green,
                surface: Colors.white,
                error: Colors.red,
                onPrimary: Colors.white,
                onSecondary: Colors.black,
                onSurface: Colors.black,
                onError: Colors.white,
                brightness: Brightness.light,
              );
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  appBarTheme: AppBarTheme(backgroundColor: color),
                  colorScheme: myColorScheme,
                ),
                home: const HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
