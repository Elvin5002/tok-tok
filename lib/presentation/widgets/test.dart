

import 'package:flutter/material.dart';
import 'package:tok_tok/presentation/widgets/custom_textfield.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: CustomTextField.password(hint: "dsfsdf",),
        ),
      ),
    );
  }
}
