import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';

extension IntExtensions on int {
  double get gridHeightForGridItemCount {
    final length = (this / 3).ceil();
    if (length < 1) return 300.h;
    return AppConstants.mainAxisExtent * length +
        (length - 1) * AppConstants.feedAxisSpace +
        AppConstants.feedGridPadding * 2;
  }
}
