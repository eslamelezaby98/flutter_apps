import 'package:flutter/material.dart';
import '../../../../app_manager/color_manager.dart';

class CreateRoomWidget extends StatelessWidget {
  const CreateRoomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 5, top: 5, bottom: 5),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // gradient: Colors.white,
          border: Border.all(
            color: ColorManager.facebookBlue,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.video_call,
              color: Colors.deepPurple,
              size: 30,
            ),
            Text(
              'Create\nRoom',
              style: TextStyle(color: Colors.black),
              
            ),
          ],
        ),
      ),
    );
  }
}