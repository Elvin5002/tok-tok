import 'package:flutter/material.dart';

import 'story_items.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Row(
            children: [
              StoryItems(
                highlight: "Hangout",
                imagePath: "assets/png/account_details_pp.png",
              ),
              StoryItems(
                highlight: "New Year",
                imagePath: "assets/png/account_details_pp.png",
              ),
              StoryItems(
                highlight: "Friends",
                imagePath: "assets/png/account_details_pp.png",
              ),
              StoryItems(
                highlight: "Beach",
                imagePath: "assets/png/account_details_pp.png",
              ),
              StoryItems(
                highlight: "Holiday",
                imagePath: "assets/png/account_details_pp.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
