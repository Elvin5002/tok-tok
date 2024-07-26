import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class Counter extends StatelessWidget {
const Counter({ super.key });

  @override
  Widget build(BuildContext context){
    return Countdown(
        seconds: 60,
        build: (_, double time) => Text(
        '${(time.round()).toString()} s',
        style: const TextStyle(color: AppColors.primary),
      ),
      interval: const Duration(seconds: 1),
      onFinished: () {

      },
    );
  }
}