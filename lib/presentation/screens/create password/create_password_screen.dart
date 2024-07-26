import 'package:flutter/material.dart';
import '../../../utils/extensions/sizedbox_extension.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import 'widgets/image_view.dart';
import 'widgets/inputs_view.dart';
import '../../widgets/custom_appbar.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';

class CreatePasswordScreen extends StatelessWidget {
const CreatePasswordScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: AppPaddings.a24,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomAppbar(title: AppStrings.createPassTxt,),
              24.h,
              const ImageView(),
              24.h,
              const InputsView(),
              36.h,
              CustomButton(
                text: AppStrings.contiuneTxt,
                onPressed: () => _dialogBuilder(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => SizedBox(
        width: 340,
        height: 250,
        child: AlertDialog(
          icon: SizedBox(width: 185, height: 180, child: Image.asset(AppAssets.success)),
          content: const Text(
            AppStrings.congratulationTxt,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            CustomButton(
              text: AppStrings.homeTxt,
              //onTap: () => context.to(page),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}