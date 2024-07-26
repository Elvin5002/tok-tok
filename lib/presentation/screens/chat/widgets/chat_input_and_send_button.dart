import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../cubits/chat/chat_cubit.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../widgets/custom_textfield.dart';

class ChatInputAndSendButton extends StatelessWidget {
  const ChatInputAndSendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return Padding(
      padding: AppPaddings.a16 + MediaQuery.viewInsetsOf(context),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: chatCubit.messageController,
              hint: 'Type message..',
              suffixIcon: Icons.camera_alt,
            ),
          ),
          12.horizontalSpace,
          GestureDetector(
            onTap: () => chatCubit.sendMessage(),
            child: SizedBox(
              height: 56,
              width: 56,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.send,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
