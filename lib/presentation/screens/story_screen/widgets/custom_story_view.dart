import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../../cubits/story/story_cubit.dart';
import '../../../../utils/extensions/navigation_extension.dart';
import 'custom_story_item.dart';
import 'reply_input.dart';

class CustomStoryView extends StatefulWidget {
  const CustomStoryView({
    super.key,
    required this.userId,
    required this.index,
    required this.isLastPage,
  });

  final String userId;
  final int index;
  final bool isLastPage;

  @override
  State<CustomStoryView> createState() => _CustomStoryViewState();
}

class _CustomStoryViewState extends State<CustomStoryView> {
  late final StoryCubit _storyCubit;

  @override
  void initState() {
    _storyCubit = context.read<StoryCubit>();
    _storyCubit.getAnyUserStory(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<StoryCubit, StoryState>(
        builder: (context, state) {
          if (state is! StorySuccess) {
            return const Center(
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: StoryView(
                  progressPosition: ProgressPosition.top,
                  repeat: false,
                  controller: _storyCubit.controller,
                  storyItems: _storyCubit.allStories!
                      .map(
                        (story) => CustomStoryItem.view(
                          _storyCubit,
                          story,
                        ),
                      )
                      .toList(),
                  onStoryShow: (storyItem, index) => print("Showing a story"),
                  onComplete: () async {
                    if (widget.isLastPage) {
                      context.back();
                      return;
                    }
                    int i = widget.index + 1;
                    await _storyCubit.pageController.animateToPage(
                      i,
                      duration: Durations.medium2,
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
              const ReplyInput(),
            ],
          );
        },
      ),
    );
  }
}
