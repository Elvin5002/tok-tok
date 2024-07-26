import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/forgot_password/forgot_password_cubit.dart';
import '../../../widgets/custom_button.dart';
import '../../verification/widgets/counter.dart';
import '../../../../utils/extensions/navigation_extension.dart';
import '../../../../utils/helpers/pager.dart';
import 'mid_view.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/extensions/sizedbox_extension.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return StreamBuilder<Object>(
      stream: cubit.isClicked.stream,
      builder: (context, snapshot) {
        return Column(
          children: [
            MidView(
              color: cubit.isClicked.value? AppColors.primary: Colors.transparent,
              image: AppAssets.message,
              title: AppStrings.smsTxt,
              text: AppStrings.phoneTxt,
              onTap: () {
                cubit.isClicked.value = true;
              },
            ),
            20.h,
            MidView(
              color: cubit.isClicked.value? Colors.transparent: AppColors.primary,
              image: AppAssets.email,
              title: AppStrings.emailTxt,
              text: AppStrings.exampleEmailTxt,
              onTap: () {
                cubit.isClicked.value = false;
              },
            ),
            40.h,
            CustomButton(
              onPressed: () {
                context.to(Pager.verification);
                const Counter();
              },
              text: AppStrings.contiuneTxt,
            ),
          ],
        );
      }
    );
  }
}
