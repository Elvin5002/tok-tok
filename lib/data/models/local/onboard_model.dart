import 'package:tok_tok/utils/constants/app_strings.dart';

import '../../../utils/constants/app_assets.dart';

class OnboardModel {
  const OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  static const List<OnboardModel> onboardItems = [
    OnboardModel(
      image: AppAssets.ob1,
      title: AppStrings.theBestSocialMediaApp,
      description: AppStrings.loremIpsum,
    ),
    OnboardModel(
      image: AppAssets.ob2,
      title: AppStrings.letsConnectWithEveryone,
      description: AppStrings.loremIpsum,
    ),
    OnboardModel(
      image: AppAssets.ob3,
      title: AppStrings.everythingYouCanDoInApp,
      description: AppStrings.loremIpsum,
    ),
  ];
}
