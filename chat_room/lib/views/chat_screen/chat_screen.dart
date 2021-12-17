import 'package:chat_room/controllers/firestore_model_view.dart';
import 'package:chat_room/helper/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var messageProvider =
        Provider.of<MessageController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Consumer<MessageController>(
                builder: (context, value, child) {
                  return Container(
                    height: size.height / 20,
                    width: size.width,
                    color: Colors.white,
                    child: Text(
                      'test',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: size.height / 8,
            width: size.width,
            child: Row(
              children: [
                // Expanded(
                //     child: TextFormField(
                //   onChanged: messageProvider.addUser,
                // )),
                IconButton(
                  onPressed: messageProvider.addUser,
                  
                  // () {
                  //   messageProvider.addUser,
                  //       // .collection('messages')
                  //       // .add({
                  //       //   'sender':messageProvider.user,
                  //       //   'text':messageProvider.message,
                  //       // });
                  // },
                  icon: const Icon(
                    Icons.send,
                    color: ColorsManager.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
