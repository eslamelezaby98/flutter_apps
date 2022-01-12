import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../app_manager/color_manager.dart';

class ProfileAvater extends StatelessWidget {
  const ProfileAvater({
    Key? key,
    required this.imageUrl,
    required this.isActive,
    required this.hasStory,
  }) : super(key: key);

  final String imageUrl;
  final bool isActive;
  final bool hasStory;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: ColorManager.facebookBlue,
          child: CircleAvatar(
            radius: hasStory ? 17 : 25,
            backgroundColor: Colors.white,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: ColorManager.online,
                    border: Border.all(width: 2, color: Colors.white),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}