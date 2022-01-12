import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/post.dart';
import 'profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key ,required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 350,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? header post
            ListTile(
              dense: true,
              title: Text(post.user.name),
              subtitle: Text(post.timeAgo),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
              ),
              leading: ProfileAvater(
                isActive: true,
                hasStory: true,
                imageUrl: post.imageUrl,
              ),
            ),
            Text(post.caption),
            //? image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                imageUrl: post.imageUrl,
              ),
            ),
            //? post actions
            Column(
              children: [
                //? likes and comments
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${post.likes} likes',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${post.comments} comments',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                //? buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPostActionButton(
                      icon: MdiIcons.thumbUp,
                      label: 'Like',
                    ),
                    buildPostActionButton(
                      icon: MdiIcons.commentOutline,
                      label: 'Comment',
                    ),
                    buildPostActionButton(
                      icon: MdiIcons.share,
                      label: 'Share',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildPostActionButton(
      {required String label, required IconData icon}) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
