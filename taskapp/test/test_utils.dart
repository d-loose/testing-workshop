import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaru/yaru.dart';

extension YaruWidgetTester on WidgetTester {
  Future<void> pumpYaruWidget(Widget widget) {
    return pumpWidget(YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: widget,
      ),
    ));
  }
}
