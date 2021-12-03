import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/constants/constants.dart';
import 'package:password_generator/constants/widgets/widgets.dart';
import 'package:password_generator/controllar/controllar.dart';

class SitePreview extends GetWidget<MyControllar> {
  final int index;
  SitePreview(this.index);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        body: FutureBuilder(
          future: controller.dbHelper.getSites(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('No Data');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${snapshot.data[index][kSiteName]}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Password : ${snapshot.data[index][kSitePassword]}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              );
            }
          },
        ),
      ),
    );
  }
}
