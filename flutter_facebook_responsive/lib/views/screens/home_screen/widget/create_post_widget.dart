import 'package:flutter/material.dart';
import '../../../../data/model/user.dart';
import 'profile_avatar.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({Key? key, required this.currentUser, required})
      : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              //? profile avatar and textfield
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ProfileAvater(
                      imageUrl: currentUser.imageUrl,
                      hasStory: true,
                      isActive: true,
                    ),
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
      ),
    );
  }
}
