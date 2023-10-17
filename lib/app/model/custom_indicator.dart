import 'package:flutter/material.dart';
import 'package:plant/assets/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildIndicator extends StatelessWidget {
  const BuildIndicator({super.key, required this.activeIndex, required this.count});

  final int activeIndex, count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: AppColor.cBlack.withAlpha(150),
        activeDotColor: AppColor.cPrimary,
        dotHeight: 8,
        dotWidth: 8,
      ),
    );
  }
}
