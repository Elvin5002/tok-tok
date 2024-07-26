import 'package:flutter/material.dart';

import '../../../../utils/extensions/int_extensions.dart';
import 'custom_grid_view_builder.dart';

class TabBarViewItems extends StatelessWidget {
  const TabBarViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.gridHeightForGridItemCount,
      child: const TabBarView(
        children: [
          CustomGridViewBuilder(),
          CustomGridViewBuilder(),
          CustomGridViewBuilder(),
        ],
      ),
    );
  }
}
