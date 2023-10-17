import 'package:flutter/material.dart';
import 'package:plant/assets/utils/colors.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});

  final IconData icon;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.cWhite),
          Text(title,
              style: const TextStyle(
                  color: AppColor.cWhite, fontWeight: FontWeight.bold)),
          Text(subTitle,
              style: const TextStyle(color: AppColor.cWhite, fontSize: 12)),
        ],
      ),
    );
  }
}
