import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/app_manager/color_manager.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedTap,
    required this.onTap,
  }) : super(key: key);
  final List<IconData> icons;
  final int selectedTap;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorManager.facebookBlue,
            width: 2,
          ),
        ),
      ),
      onTap: onTap,
      tabs: icons
          .asMap()
          .map(
            (index, icon) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  size: 30,
                  color: index == selectedTap
                      ? ColorManager.facebookBlue
                      : Colors.black45,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
