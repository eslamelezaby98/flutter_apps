import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/data/model/user.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/profile_avatar.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({Key? key, required this.currentUser, required})
      : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.white,
        child: Column(
          children: [
            //? profile avatar and textfield
            Row(
              children: [
                ProfileAvater(
                  imageUrl: currentUser.imageUrl,
                  hasStory: true,
                  isActive: true,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'What\'s in your mind',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            //? post actions
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //? go live
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Live',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const VerticalDivider(width: 8),
                  //? add photo
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text(
                      'Photos',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const VerticalDivider(width: 8),
                  //? room
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text(
                      'Room',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}