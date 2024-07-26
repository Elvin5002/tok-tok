import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feed_card_action_view.dart';
import 'feed_card_media.dart';
import 'feed_card_user_info.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          const FeedCardUserInfo(),
          10.verticalSpace,
          const FeedCardMedia(),
          5.verticalSpace,
          const FeedCardActionView()
        ],
      ),
    );
  }
}
