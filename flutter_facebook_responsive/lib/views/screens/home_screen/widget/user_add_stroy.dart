import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../data/dummy_data/dummy_user_data.dart';
import 'circle_button.dart';

class UserAddStroy extends StatelessWidget {
  const UserAddStroy({
    Key? key,
  }) : super(key: key);

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
            image: CachedNetworkImageProvider(currentUser.imageUrl),
          ),
        ),
        child: Center(
          child: CircleButton(
            icon: Icons.add,
            onPress: () {},
          ),
        ),

        //  Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       CircleButton(
        //         icon: Icons.add,
        //         onPress: () {},
        //       ),
        //       const Text(
        //         'Add to stroy',
        //         style: TextStyle(
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
