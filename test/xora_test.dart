import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xora/xora.dart';

void main() {
  test('theme builds', () {
    final light = XoraTheme.light();
    final dark = XoraTheme.dark();
    expect(light.brightness, Brightness.light);
    expect(dark.brightness, Brightness.dark);
  });
}

