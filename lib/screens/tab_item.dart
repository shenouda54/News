import 'package:flutter/material.dart';
import 'package:news/SourceResponse.dart';
import 'package:news/app_colors.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryLightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColor.primaryLightColor)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? AppColor.whiteColor : AppColor.primaryLightColor,
        ),
      ),
    );
  }
}
