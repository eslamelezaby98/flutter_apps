import 'package:flutter/material.dart';
import '../../../app_manager/color_manager.dart';
import '../../../data/dummy_data/dummy_online_users_data.dart';
import '../../../data/dummy_data/dummy_posts_data.dart';
import '../../../data/dummy_data/dummy_stories_data.dart';
import '../../../data/dummy_data/dummy_user_data.dart';
import '../../../data/model/post.dart';
import '../../../data/model/stroy.dart';
import '../../../data/model/user.dart';
import '../home_screen/widget/circle_button.dart';
import '../home_screen/widget/create_post_widget.dart';
import '../home_screen/widget/create_room_widget.dart';
import '../home_screen/widget/post_widget.dart';
import '../home_screen/widget/profile_avatar.dart';
import '../home_screen/widget/stories_widget.dart';
import '../home_screen/widget/user_add_stroy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({
    Key? key,
    required this.trackingScrollController,
  }) : super(key: key);
  final TrackingScrollController trackingScrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
      slivers: [
        //? app bar
        SliverAppBar(
          floating: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: ColorManager.facebookBlue,
              wordSpacing: -1.5,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleButton(
              icon: Icons.search,
              onPress: () {},
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              onPress: () {},
            ),
          ],
        ),
        //? create post.
        const CreatePostWidget(currentUser: currentUser),
        //? create room and active users
        SliverPadding(
          padding: const EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 50,
              color: Colors.white,
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
                    color: Colors.white,
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
        //? Stories
        SliverPadding(
          padding: const EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 170,
              color: Colors.white,
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
    );
  }
}
