import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext{
  double get fullHeight => MediaQuery.of(this).size.height;
  double get fullWidth => MediaQuery.of(this).size.width;
}
