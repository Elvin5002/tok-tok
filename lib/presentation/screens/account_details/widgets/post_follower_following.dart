import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class PostFollowerFollowing extends StatelessWidget {
  const PostFollowerFollowing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '267',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Posts'),
          ],
        ),
        SizedBox(
          height: 50,
          child: VerticalDivider(
            color: AppColors.grey500,
            thickness: 0,
            width: 54,
          ),
        ),
        Column(
          children: [
            Text(
              '24,278',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Followers'),
          ],
        ),
        SizedBox(
          height: 50,
          child: VerticalDivider(
            color: Colors.grey,
            thickness: 0,
            width: 54,
          ),
        ),
        Column(
          children: [
            Text(
              '237',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Following'),
          ],
        ),
      ],
    );
  }
}
