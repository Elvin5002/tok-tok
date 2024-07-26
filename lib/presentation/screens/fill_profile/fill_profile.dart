import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';

import '../../../cubits/fill/user_info_cubit.dart';
import '../../../cubits/fill/user_info_state.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/extensions/navigation_extension.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/helpers/snacks.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class FillProfile extends StatelessWidget {
  const FillProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserInfoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fill Your Profile',
          style: AppTextStyles.appbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.h24,
          child: Column(
            children: [
              Center(
                child: Stack(children: [
                  StreamBuilder<File?>(
                    stream: cubit.imageSubject.stream,
                    builder: (context, snapshot) => snapshot.data == null
                        ? Image.asset(
                            AppAssets.defaultAvatar,
                            height: 140.r,
                            width: 140.r,
                          )
                        : Image.file(
                            snapshot.data!,
                            height: 140.r,
                            width: 140.r,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => cubit.openGallery(),
                      child: Image.asset('assets/png/profil_edit.png'),
                    ),
                  ),
                ]),
              ),
              15.verticalSpace,
              CustomTextField(
                hint: AppStrings.fullName,
                controller: cubit.controllers["fullName"],
              ),
              15.verticalSpace,
              CustomTextField(
                hint: AppStrings.username,
                controller: cubit.controllers["username"],
              ),
              15.verticalSpace,
              CustomTextField(
                hint: AppStrings.birthday,
                controller: cubit.controllers["birthday"],
              ),
              15.verticalSpace,
              CustomTextField(
                hint: AppStrings.email,
                controller: cubit.controllers["email"],
                enabled: false,
              ),
              15.verticalSpace,
              CustomTextField(
                hint: AppStrings.phoneTxt,
                controller: cubit.controllers["phoneNumber"],
                prefixIcon: Icons.phone_android,
              ),
              15.verticalSpace,
              CustomTextField(
                hint: AppStrings.occupation,
                controller: cubit.controllers["occupation"],
              ),
              35.verticalSpace,
              BlocConsumer<UserInfoCubit, UserInfoState>(
                listener: (context, state) {
                  if (state is UserInfoSuccess) {
                    context.to(Pager.home);
                  } else if (state is UserInfoError) {
                    Snacks.error(context, state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: 'Continue',
                    isLoading: state is UserInfoLoading,
                    onPressed: () => cubit.updateUsers(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
