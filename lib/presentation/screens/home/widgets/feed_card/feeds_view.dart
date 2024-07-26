import 'package:flutter/material.dart';

import '../story_layout.dart';
import 'feed_card.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 15 + (1),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const StoryLayout();
          }
          return const FeedCard();
        });
  }
}
