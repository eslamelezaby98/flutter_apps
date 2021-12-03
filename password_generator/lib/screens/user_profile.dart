import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/controllar/controllar.dart';
import 'package:password_generator/models/site.dart';

class UserProfileScreen extends StatelessWidget {
  static const screen_route = 'user_profile_screen';
  final MyControllar controllar = Get.put(MyControllar());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1a1a2e),
      appBar: AppBar(
        backgroundColor: Color(0xff1a1a2e),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'My Profiles',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileInfo(size: size),
            SizedBox(height: 10),
            GetBuilder<MyControllar>(
              builder: (controllar) => SettingListTile(
                size: size,
                title: 'Dark Mode',
                icon: Icons.lightbulb_outline,
                trailing: Checkbox(
                  value: controllar.isDark,
                  onChanged: (value) {
                    controllar.switchToDark(value);
                  },
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            SettingListTile(
              size: size,
              title: 'Languages',
              icon: Icons.language_outlined,
              onTap: () {
                Get.bottomSheet(
                  Container(
                    height: 300,
                    width: 100,
                    color: Color(0xff30475e),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Choose Language:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              LangugeContainer(
                                size: size,
                                title: 'English',
                                onTap: () {
                                  print('English');
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(height: 10),
                              LangugeContainer(
                                size: size,
                                title: 'Arabic',
                                onTap: () {
                                  print('Arabic');
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            SettingListTile(
              size: size,
              title: 'About',
              icon: Icons.info_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class LangugeContainer extends StatelessWidget {
  const LangugeContainer({
    @required this.size,
    this.title,
    this.onTap,
  });

  final Size size;
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff1a1a2e),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    this.title,
    this.icon,
    this.onTap,
    this.trailing,
    @required this.size,
  });

  final Size size;
  final String title;
  final IconData icon;
  final Function onTap;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xff30475e),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 6,
      decoration: BoxDecoration(
        color: Color(0xff30475e),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: size.width / 3,
              height: size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Alesso_profile.png/467px-Alesso_profile.png',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eslam Elezaby',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      ' : ${Site.numbersOfSites} Sites',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
