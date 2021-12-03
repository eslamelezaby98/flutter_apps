import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/constants/constants.dart';
import 'package:password_generator/controllar/controllar.dart';
import 'package:password_generator/screens/site_preview.dart';
import 'package:password_generator/screens/generated_password_screen.dart';

class HomeScreen extends GetWidget<MyControllar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
        leading: SizedBox(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateData();
          Get.to(() => UserInfoScreen());
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: FutureBuilder(
        future: controller.dbHelper.getSites(),
        builder: (context, snapshot) => !snapshot.hasData
            ? Center(
                child: Text(
                  'No Site added yet',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _buildSiteCard(snapshot, index, context, size);
                },
              ),
      ),
    );
  }

  InkWell _buildSiteCard(AsyncSnapshot<dynamic> snapshot, int index,
      BuildContext context, Size size) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              snapshot.data[index][kSiteName],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              snapshot.data[index][kSitePassword],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white60),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.copy,
                color: Colors.white,
              ),
              onPressed: () {
                controller.copyToClipbord(
                  snapshot.data[index][kSitePassword],
                );
              },
            ),
          ),
        ),
      ),
      onTap: () {
        Get.to(() => SitePreview(index));

        // showBottomSheet(
        //   context: context,
        //   builder: (context) => BottomSheet(
        //     builder: (context) => Container(
        //       width: size.width,
        //       height: size.height / 2,
        //       child: Column(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(top: 20),
        //             child: Text(
        //               snapshot.data[index][kSiteName],
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 30,
        //               ),
        //             ),
        //           ),
        //           SizedBox(height: 20),
        //           Text(
        //             'Password : ${snapshot.data[index][kSitePassword]}',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 30,
        //             ),
        //           ),
        //           SizedBox(height: 20),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               BuildButton(
        //                 buttonTitle: 'Edit',
        //                 buttonColor: Colors.white,
        //               ),
        //               BuildButton(
        //                 buttonTitle: 'Delete',
        //                 buttonColor: Colors.red,
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     backgroundColor: Colors.black,
        //     onClosing: () {},
        //   ),
        // );
      },
    );
  }
}
