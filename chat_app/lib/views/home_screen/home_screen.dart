import 'package:chat_app/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                title: const Text(
                  'Eslam',
                ),
                subtitle: Text(
                  'i will misss you',
                  style: Theme.of(context).textTheme.caption,
                ),
                trailing: const Icon(
                  Icons.message,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
