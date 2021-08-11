import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/constants/constants.dart';
import 'package:password_generator/constants/widgets/widgets.dart';
import 'package:password_generator/controllar/controllar.dart';
import 'package:password_generator/screens/user_info_screen.dart';
import 'package:password_generator/screens/user_profile.dart';

class HomeScreen extends StatelessWidget {
  static const screen_route = 'home_screen';
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
          'Generate Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            controllar.updateData();
            Navigator.of(context).pushNamed(UserInfoScreen.screenRoute);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_outline_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, UserProfileScreen.screen_route);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: controllar.dbHelper.getSites(),
        builder: (context, snapshot) => !snapshot.hasData
            ? Container()
            : ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff30475e),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text(
                            snapshot.data[index][kSiteName],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            snapshot.data[index][kSitePassword],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.copy,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controllar.copyToClipbord(
                                snapshot.data[index][kSitePassword],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => BottomSheet(
                          onClosing: () {},
                          builder: (context) => Container(
                            width: size.width,
                            height: size.height / 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    snapshot.data[index][kSiteName],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Password : ${snapshot.data[index][kSitePassword]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    BuildButton(
                                      buttonTitle: 'Edit',
                                      buttonColor: Colors.white,
                                    ),
                                    BuildButton(
                                      buttonTitle: 'Delete',
                                      buttonColor: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Color(0xff0f3460),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
