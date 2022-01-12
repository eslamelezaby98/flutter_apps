import 'package:flutter/material.dart';
import '../../../data/dummy_data/dummy_online_users_data.dart';
import '../../../data/dummy_data/dummy_options_data.dart';
import '../../../data/dummy_data/dummy_posts_data.dart';
import '../../../data/dummy_data/dummy_stories_data.dart';
import '../../../data/dummy_data/dummy_user_data.dart';
import '../../../data/model/post.dart';
import '../../../data/model/stroy.dart';
import '../../../data/model/user.dart';
import '../home_screen/widget/create_post_widget.dart';
import '../home_screen/widget/create_room_widget.dart';
import '../home_screen/widget/post_widget.dart';
import '../home_screen/widget/profile_avatar.dart';
import '../home_screen/widget/stories_widget.dart';
import '../home_screen/widget/user_add_stroy.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({Key? key, required this.trackingScrollController})
      : super(key: key);
  final TrackingScrollController trackingScrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LeftContainer(),
        const Spacer(),
        CenterContainer(trackingScrollController: trackingScrollController),
        const Spacer(),
        const RightContainer(),
      ],
    );
  }
}

class LeftContainer extends StatelessWidget {
  const LeftContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView.builder(
          itemCount: 1 + moreOptionsList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ProfileAvater(
                        imageUrl: currentUser.imageUrl,
                        isActive: true,
                        hasStory: false),
                    const SizedBox(width: 10),
                    Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            }
            final List option = moreOptionsList[index - 1];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: option[1],
                      child: Icon(option[0]),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        option[2],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RightContainer extends StatelessWidget {
  const RightContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Contacts',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: onlineUsers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ProfileAvater(
                          imageUrl: onlineUsers[index].imageUrl,
                          isActive: true,
                          hasStory: true,
                        ),
                        const SizedBox(width: 10),
                        Text(onlineUsers[index].name),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CenterContainer extends StatelessWidget {
  const CenterContainer({
    Key? key,
    required this.trackingScrollController,
  }) : super(key: key);

  final TrackingScrollController trackingScrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: CustomScrollView(
        controller: trackingScrollController,
        slivers: [
          //? Stories
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 170,
                // color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1 + stories.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const UserAddStroy();
                    } else {
                      Story story = stories[index - 1];
                      return StroiesWidget(
                        hasStory: story.isViewed,
                        isActive: story.isViewed,
                        userName: story.user.name,
                        imageUrl: story.imageUrl,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          //? create post.
          const CreatePostWidget(currentUser: currentUser),
          //? create room and active users
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1 + onlineUsers.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const CreateRoomWidget();
                    }
                    final User user = onlineUsers[index - 1];
                    return Container(
                      margin: const EdgeInsets.all(2),
                      height: 40,
                      width: 40,
                      child: ProfileAvater(
                        imageUrl: user.imageUrl,
                        isActive: true,
                        hasStory: false,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          //? posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostWidget(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
