import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tok_tok/presentation/screens/fill_profile/fill_profile.dart';
import 'package:tok_tok/presentation/widgets/custom_button.dart';
import 'package:tok_tok/presentation/widgets/custom_textfield.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/constants/app_paddings.dart';
import 'package:tok_tok/utils/constants/app_strings.dart';
import 'package:tok_tok/utils/constants/app_text_styles.dart';
import 'package:tok_tok/utils/extensions/navigation_extension.dart';
import 'package:tok_tok/utils/extensions/sizedbox_extension.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({
    super.key,
  });

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final ValueNotifier<int> _selectedValue = ValueNotifier<int>(0);
  List items = [];
  TextEditingController? controller;
  @override
  void initState() {
    super.initState();
    parseJson();
  }

  Future<void> parseJson() async {
    final String jsonString =
        await rootBundle.loadString(AppAssets.countrys);
    final jsonResponse = jsonDecode(jsonString);
    setState(() {
      items = jsonResponse["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.selectCounrty,style: AppTextStyles.appbarTextStyle,),
      ),
      body: Padding(
        padding: AppPaddings.a24,
        child: Column(
          children: [
             SizedBox(
              height: 56,
              child: CustomTextField(
                hint: 'Search',
                prefixIcon: Icons.search,
                controller: controller,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _selectedValue,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: AppPaddings.t12,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: index == _selectedValue.value
                                    ? AppColors.primary
                                    : AppColors.grey200),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: RadioListTile<int>(
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: AppColors.primary,
                            title: Row(children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.network(items[index]['flag'])),
                              15.w,
                              Text(items[index]['code'].toString().toUpperCase(),style: AppTextStyles.countryCodeStyle,),
                              15.w,
                              SizedBox(
                                width: 148,
                                child: Text(items[index]['country'],
                                    style: AppTextStyles.countryTextStyle,
                                    overflow: TextOverflow.ellipsis,),
                              )
                            ]),
                            value: index,
                            groupValue: value,
                            onChanged: (newValue) {
                              _selectedValue.value = newValue!;
                            },
                          ),

                        ),
                      );
                    },
                  );
                },
              ),
            ),
            CustomButton(text: AppStrings.contiuneTxt, onPressed:() => context.to(const FillProfile()))
          ],
        ),
      ),
    );
  }
}
