import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../cubits/home/home_cubit.dart';
import '../../../../utils/extensions/navigation_extension.dart';
import '../../../../utils/helpers/pager.dart';
import 'story_avatar.dart';

class UserStoryList extends StatelessWidget {
  const UserStoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Expanded(
      child: StreamBuilder(
          stream: homeCubit.getAllUsersStories(),
          builder: (context, snapshot) {
            final docs = snapshot.data?.docs ?? [];
            return Skeletonizer(
              enabled: !snapshot.hasData,
              child: ListView.builder(
                  itemCount: docs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final story = docs[index].data();
                    return StoryAvatar(
                      isAllStatusSeen: false,
                      story: story,
                      onTap: () => context.to(Pager.story(docs[index])),
                    );
                  }),
            );
          }),
    );
  }
}
