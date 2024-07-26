import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarItems extends StatelessWidget {
  final IconData icon;
  final String label;

  const TabBarItems({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          6.horizontalSpace,
          Text(label),
        ],
      ),
    );
  }
}
