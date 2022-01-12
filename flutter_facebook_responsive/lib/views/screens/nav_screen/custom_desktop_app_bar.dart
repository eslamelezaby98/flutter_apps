import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/app_manager/color_manager.dart';
import 'package:flutter_facebook_responsive/data/dummy_data/dummy_user_data.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/circle_button.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/profile_avatar.dart';
import 'package:flutter_facebook_responsive/views/screens/nav_screen/custom_tab_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomDesktopAppBar extends StatelessWidget {
  const CustomDesktopAppBar({
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 0.4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: ColorManager.facebookBlue,
                wordSpacing: -1.5,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedTap: selectedTap,
              onTap: onTap,
              isBottomIndicuator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Row(
                    children: [
                      ProfileAvater(
                        imageUrl: currentUser.imageUrl,
                        isActive: true,
                        hasStory: false,
                      ),
                      Text(currentUser.name),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                CircleButton(
                  icon: Icons.color_lens,
                  onPress: () {},
                ),
                const SizedBox(width: 10),
                CircleButton(
                  icon: Icons.search,
                  onPress: () {},
                ),
                const SizedBox(width: 10),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  onPress: () {},
                ),
                const SizedBox(width: 10),
                CircleButton(
                  icon: Icons.arrow_drop_down_rounded,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
