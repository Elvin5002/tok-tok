import 'package:flutter/cupertino.dart';

class AccountDetailsText extends StatelessWidget {
  const AccountDetailsText({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
  });

  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
