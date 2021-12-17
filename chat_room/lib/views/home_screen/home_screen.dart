import 'package:chat_room/helper/routes_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.chatScreen);
          },
          child: const Text('Chat Screen'),
        ),
      ),
    );
  }
}
