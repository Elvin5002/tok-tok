import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/story/story_cubit.dart';
import 'widgets/custom_story_view.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, this.story});

  final story;

  @override
  Widget build(BuildContext context) {
    final storyCubit = context.read<StoryCubit>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder(
            stream: storyCubit.getAllUsersStories(story),
            builder: (_, snapshot) {
              final querySnapshot = snapshot.data;
              return PageView.builder(
                itemCount: querySnapshot?.docs.length ?? 0,
                controller: storyCubit.pageController,
                itemBuilder: (_, i) {
                  final doc = querySnapshot!.docs[i];
                  return CustomStoryView(
                    userId: doc.id,
                    index: i,
                    isLastPage: querySnapshot.docs.length - 1 == i,
                  );
                },
              );
            }),
      ),
    );
  }
}
