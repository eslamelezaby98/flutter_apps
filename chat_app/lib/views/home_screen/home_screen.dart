import 'package:chat_app/data/services/database_services.dart';
import 'package:chat_app/helper/constants_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User loggedUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController searchController = TextEditingController();
  DBServices dbServices = DBServices();
  bool isSearch = true;

  getCureentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  getUserByUserName(String searchUser) async {
    var userData = await firestore
        .collection(ConstantsManager.users)
        .where(ConstantsManager.userName, isEqualTo: searchUser)
        .get();
    // return userData;
  }

  appBarActions(BuildContext context) {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            getUserByUserName;
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Searching....',
                ),
                onChanged: (String value) {
                  value = searchController.text;
                },
              )
            : const Text('Home'),
        leading: isSearch
            ? BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Container(),
        actions: appBarActions(context),
      ),
      body: isSearch
          ? Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream:
                      firestore.collection(ConstantsManager.users).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final usersSnapshots = snapshot.data!.docs;
                      List<Widget> usersCatdsList = [];
                      for (var item in usersSnapshots) {
                        final items = item.data() as Map<String, dynamic>;
                        final userName = items[ConstantsManager.userName];
                        final userEmail = items[ConstantsManager.userEmail];
                        UserCard(
                          userName: userName,
                          userEmail: userEmail,
                          onTap: () {},
                        );
                        usersCatdsList.add(
                          UserCard(
                            userName: userName,
                            userEmail: userEmail,
                            onTap: () {
                              // dbServices.createChatRoom(, [loggedUser.email,userName]);
                            },
                          ),
                        );
                        print('user name : $userName , userEmail : $userEmail');
                      }
                      return Column(
                        children: usersCatdsList,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            )
          : Container(),
    );
  }
}

class UserCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final Function onTap;

  const UserCard({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          onTap: () {
            onTap;
          },
          title: Text(
            userName,
          ),
          subtitle: Text(
            userEmail,
            style: Theme.of(context).textTheme.caption,
          ),
          trailing: const Icon(
            Icons.message,
          ),
        ),
      ),
    );
  }
}
