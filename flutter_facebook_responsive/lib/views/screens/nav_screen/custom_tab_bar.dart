import 'package:flutter/material.dart';
import '../../../app_manager/color_manager.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedTap,
    required this.onTap,
    required this.isBottomIndicuator,
  }) : super(key: key);
  final List<IconData> icons;
  final int selectedTap;
  final Function(int) onTap;
  final bool isBottomIndicuator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicuator == true
            ? const Border(
                bottom: BorderSide(
                  color: ColorManager.facebookBlue,
                  width: 2,
                ),
              )
            : const Border(
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
