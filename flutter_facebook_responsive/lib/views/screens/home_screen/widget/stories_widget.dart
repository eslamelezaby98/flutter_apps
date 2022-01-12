import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'profile_avatar.dart';

class StroiesWidget extends StatelessWidget {
  const StroiesWidget({
    Key? key,
    required this.hasStory,
    required this.imageUrl,
    required this.isActive,
    required this.userName,
  }) : super(key: key);

  final String imageUrl;
  final String userName;
  final bool isActive;
  final bool hasStory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 160,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: ProfileAvater(
            imageUrl: imageUrl,
            isActive: isActive,
            hasStory: hasStory,
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       ProfileAvater(
        //         imageUrl: imageUrl,
        //         isActive: isActive,
        //         hasStory: hasStory,
        //       ),
        //       Text(
        //         userName,
        //         style: const TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 14,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
