import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:story_view/widgets/story_image.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../../cubits/story/story_cubit.dart';
import 'story_header.dart';

class CustomStoryItem extends StoryItem {
  CustomStoryItem._(
    super.view, {
    required super.duration,
  });

  factory CustomStoryItem.view(
    StoryCubit storyCubit,
    QueryDocumentSnapshot<Map<String, dynamic>> story,
  ) {
    return CustomStoryItem._(
      duration: const Duration(seconds: 3),
      ColoredBox(
        color: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            StoryImage.url(
              story['statusPhoto'],
              controller: storyCubit.controller,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: 24,
              child: StoryHeader(story: story),
            ),
          ],
        ),
      ),
    );
  }
}
