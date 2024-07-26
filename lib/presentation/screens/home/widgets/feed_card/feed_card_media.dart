
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feed_card_dot_indicator.dart';

class FeedCardMedia extends StatelessWidget {
  const FeedCardMedia({super.key});



  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return  SizedBox(
      height: 380.r,
      child: Material(
        borderRadius: BorderRadius.circular(32.r),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://images.unsplash.com/photo-1578736641330-3155e606cd40?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        fit: BoxFit
                            .cover, // Todo: olculeri duzeltmek lazimdir
                      ),
                    ],
                  );
                }),
             FeedCardDotIndicator(pageController: pageController,)
          ],
        ),
      ),
    );
  }
}
