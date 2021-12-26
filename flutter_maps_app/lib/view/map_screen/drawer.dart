import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_controller.dart';
import 'package:flutter_maps_app/helper/routes_manager.dart';
import 'package:provider/provider.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<AuthController>(context);
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width * 0.6,
        color: Colors.black,
        child: Column(
          children: [
            // user pic and name
            SizedBox(
              height: size.height / 4,
              width: size.width * 0.6,
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(
                      'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
                      scale: 20,
                    ),
                  ),
                  Text(
                    'Daivd Alaxabnder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // more
            buildCustomCard(
              icon: Icons.account_box,
              title: 'Profile',
              onTap: () {},
            ),
            buildCustomCard(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
            buildCustomCard(
              icon: Icons.dark_mode,
              title: 'Dark mode',
              onTap: () {},
            ),
            buildCustomCard(
              icon: Icons.history,
              title: 'History',
              onTap: () {},
            ),
            buildCustomCard(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () async {
                await provider.logout();
                Navigator.popAndPushNamed(context, Routes.authScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Card buildCustomCard({
    required String title,
    required Function() onTap,
    required IconData icon,
  }) {
    return Card(
      color: Colors.black,
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
