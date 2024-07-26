import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/local/onboard_model.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial());

  final onboardItems = OnboardModel.onboardItems;
  final pageController = PageController();

  final isLastPage = BehaviorSubject<bool>();

  int get currentPageIndex => pageController.page?.toInt() ?? 0;

  void nextPage() {
    pageController.jumpToPage(currentPageIndex + 1);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    isLastPage.close();
    return super.close();
  }
}
