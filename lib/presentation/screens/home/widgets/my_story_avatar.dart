import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../cubits/home/home_cubit.dart';
import '../../../../utils/extensions/navigation_extension.dart';
import '../../../../utils/helpers/pager.dart';
import 'add_new_story.dart';

class MyStoryAvatar extends StatelessWidget {
  const MyStoryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return StreamBuilder(
      stream: homeCubit.getCurrentUserStory(),
      builder: (context, snapshot) {
        final story = snapshot.data?.data();
        log('Story: $story');
        return Skeletonizer(
          enabled: !snapshot.hasData,
          child: AddNewStory(
            onTap: () {
              if (story == null) return;
              context.to(Pager.story(snapshot.data));
            },
            story: story,
          ),
        );
      },
    );
  }
}
