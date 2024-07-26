import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/endpoints.dart';
import 'widgets/all_bottom_sheet_buttons.dart';
import 'widgets/app_bar_title.dart';
import 'widgets/biography_texts.dart';
import 'widgets/follow_message_buttons.dart';
import 'widgets/post_follower_following.dart';
import '../../widgets/profile_photo.dart';
import 'widgets/story_list_view_items.dart';
import 'widgets/tab_bar_items.dart';
import 'widgets/tab_bar_view_items.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.white),
                    child: const AllBottomSheetButtons(),
                  );
                },
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        backgroundColor: AppColors.white,
        title: const AppBarTitle(),
      ),
      body: DefaultTabController(
        length: 3,
        child: ListView(
          children: [
            const Padding(
              padding: AppPaddings.a10,
              child: Center(
                child: ProfilePhoto(
                  showEdit: true,
                  url: Endpoints.defaultImageUrl,
                ),
              ),
            ),
            const Padding(
              padding: AppPaddings.a10,
              child: BiographyTexts(),
            ),
            20.verticalSpace,
            const PostFollowerFollowing(),
            40.verticalSpace,
            const FollowMessageButtons(),
            const Divider(height: 50, thickness: 1),
            const StoryListView(),
            20.verticalSpace,
            const TabBar.secondary(
              dividerHeight: 2,
              unselectedLabelColor: AppColors.grey500,
              labelColor: AppColors.gradientRed,
              indicatorColor: AppColors.gradientRed,
              tabs: [
                TabBarItems(
                  icon: Icons.feed_sharp,
                  label: "Feeds",
                ),
                TabBarItems(
                  icon: Icons.videocam,
                  label: "Shorts",
                ),
                TabBarItems(
                  icon: Icons.people,
                  label: "Tag",
                ),
              ],
            ),
            const TabBarViewItems(),
          ],
        ),
      ),
    );
  }
}
