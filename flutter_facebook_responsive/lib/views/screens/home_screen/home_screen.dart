import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/app_manager/color_manager.dart';
import 'package:flutter_facebook_responsive/data/dummy_data/dummy_online_users_data.dart';
import 'package:flutter_facebook_responsive/data/dummy_data/dummy_posts_data.dart';
import 'package:flutter_facebook_responsive/data/dummy_data/dummy_stories_data.dart';
import 'package:flutter_facebook_responsive/data/dummy_data/dummy_user_data.dart';
import 'package:flutter_facebook_responsive/data/model/post.dart';
import 'package:flutter_facebook_responsive/data/model/stroy.dart';
import 'package:flutter_facebook_responsive/data/model/user.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/circle_button.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/create_post_widget.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/create_room_widget.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/post_widget.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/profile_avatar.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/stories_widget.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/user_add_stroy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: ColorManager.facebookBlue,
      //   currentIndex: 0,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(MdiIcons.video), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      //     BottomNavigationBarItem(icon: Icon(MdiIcons.account), label: ''),
      //   ],
      // ),
      body: CustomScrollView(
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
      ),
    );
  }
}
