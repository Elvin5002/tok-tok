import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/story/story_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../widgets/custom_textfield.dart';

class ReplyInput extends StatelessWidget {
  const ReplyInput({super.key});

  @override
  Widget build(BuildContext context) {
    final storyCubit = context.read<StoryCubit>();
    return Container(
      height: 100.0,
      color: AppColors.dark,
      padding: const EdgeInsets.all(8.0),
      margin: MediaQuery.paddingOf(context),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: storyCubit.replyController,
              focusNode: storyCubit.replyFocusNode,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: AppColors.primary,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.primary),
            onPressed: () => storyCubit.reply(),
          )
        ],
      ),
    );
  }
}
