import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/constants/constants.dart';
import 'package:password_generator/constants/widgets/widgets.dart';
import 'package:password_generator/controllar/controllar.dart';
import 'package:password_generator/screens/home_screen.dart';

class SitePreview extends GetWidget<MyControllar> {
  final int index;
  final MyControllar controllar = Get.put(MyControllar());
  SitePreview(this.index);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Site Preview'),
        ),
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
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "${snapshot.data[index][kSiteName]}",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Password : ${snapshot.data[index][kSitePassword]}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BuildButton(
                        buttonTitle: 'Copy',
                        buttonColor: Colors.teal,
                        onPressed: () async {
                          controller.copyToClipbord(
                            snapshot.data[index][kSitePassword],
                          );
                        },
                      ),
                      BuildButton(
                        buttonTitle: 'Delete',
                        buttonColor: Colors.red,
                        onPressed: () async {
                          await controller.dbHelper.deleteSite(
                            snapshot.data[index][kId],
                          );
                          print('site deleted');
                          await Get.to(() => HomeScreen());
                        },
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
