import 'package:chat_app/controller/db_controller.dart';
import 'package:chat_app/helper/constants_manager.dart';
import 'package:chat_app/views/auth_screen/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User loggedUser;
  late String message;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  addMessage(String message) {
    firestore.collection(ConstantsManager.messages).add({
      ConstantsManager.text: message,
      ConstantsManager.sender: loggedUser.email
    });
  }

  getMessageStream() async {
    await for (var snapshot
        in firestore.collection(ConstantsManager.messages).snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCureentUser();
  }

  @override
  Widget build(BuildContext context) {
    var dbProvider = Provider.of<DBController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(loggedUser.email.toString()),
        leading: IconButton(
          onPressed: getMessageStream,
          icon: const Icon(Icons.cached),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // chat messsage list
          StreamBuilder<QuerySnapshot>(
            stream: firestore.collection(ConstantsManager.messages).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final messagesSnapshots = snapshot.data!.docs.reversed;
                List<Text> textWidgets = [];
                List<Widget> messagesWidgets = [];
                for (var message in messagesSnapshots) {
                  final messages = message.data() as Map<String, dynamic>;
                  final text = messages[ConstantsManager.text];
                  final sender = messages[ConstantsManager.sender];
                  ChatBubble(
                    text: text,
                    isSameUser: sender == loggedUser.email,
                  );
                  final messagewidget =
                      Text('message is : $text , from sender $sender');
                  textWidgets.add(messagewidget);
                  messagesWidgets.add(
                    ChatBubble(
                      text: text,
                      isSameUser: sender == loggedUser.email,
                    ),
                  );
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    
                    children: messagesWidgets,
                  ),
                );

                // List<Text> textWidgets = [];
                // for (var message in messagesSnapshots) {
                //   final messages = message.data() as Map<String, dynamic>;
                //   final text = messages[ConstantsManager.text];
                //   final sender = messages[ConstantsManager.sender];
                //   final messagewidget =
                //       Text('message is : $text , from sender $sender');
                //   textWidgets.add(messagewidget);
                // }
                // return Column(
                //   children: textWidgets,
                // );
              } else {
                return Container();
              }
            },
          ),

          // textfield and send button
          Row(
            children: [
              Expanded(
                child: TextFiledInput(
                  hintLabel: 'Send a message',
                  isObcure: false,
                  onChange: (String value) {
                    setState(() {
                      message = value;
                    });
                  },
                  validator: (p0) {},
                  textEditingController: dbProvider.messageController,
                ),
              ),
              IconButton(
                onPressed: () {
                  firestore.collection(ConstantsManager.messages).add({
                    ConstantsManager.text: message,
                    ConstantsManager.sender: loggedUser.email
                  });
                  dbProvider.messageController.clear();
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isSameUser,
  }) : super(key: key);

  final String text;
  final bool isSameUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(

        crossAxisAlignment:
            isSameUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(

            color: isSameUser ? Colors.teal : Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
              ),
            ),
          ),
        ],
      ),

      //  Container(
      //   height: 30,
      //   width: double.infinity,
      //   child: Align(
      //     alignment: Alignment.topLeft,
      //     child: Row(
      //       children: [
      //         Text(
      //           '3:36 PM',
      //           style: Theme.of(context).textTheme.caption,
      //         ),
      //         const SizedBox(width: 5),
      //         Text(
      //           text,
      //           style: const TextStyle(
      //             color: Colors.black87,
      //             fontSize: 15,
      //             fontWeight: FontWeight.w500,
      //             textBaseline: TextBaseline.alphabetic,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   decoration: BoxDecoration(
      //     color:isSameUser ? Colors.teal : Colors.white,
      //     borderRadius: isSameUser
      //         ? const BorderRadius.only(
      //             topLeft: Radius.circular(10),
      //             topRight: Radius.circular(10),
      //             bottomLeft: Radius.circular(10),
      //           )
      //         : const BorderRadius.only(
      //             topLeft: Radius.circular(10),
      //             topRight: Radius.circular(10),
      //             bottomRight: Radius.circular(10),
      //           ),
      //   ),
      // ),
    );
  }
}
