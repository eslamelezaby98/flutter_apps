import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/constants/constants.dart';
import 'package:password_generator/constants/widgets/widgets.dart';
import 'package:password_generator/controllar/controllar.dart';
import 'package:password_generator/database/db_helper.dart';
import 'package:password_generator/models/site.dart';
import 'package:password_generator/screens/home_screen.dart';

class UserInfoScreen extends StatelessWidget {
  static const screenRoute = 'UserInfoScreen';
  final MyControllar controllar = Get.put(MyControllar());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final dbHelper = DbHelper.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: controllar.dbHelper.getSites(),
        builder: (context, snapshot) => !snapshot.hasData
            ? Text('snapshot not has data')
            : ListView(
                children: [
                  Form(
                    child: Column(
                      children: [
                        BuildInputText(
                          hintText: 'Add Site Name',
                          keyboardType: TextInputType.name,
                          onChange: (value) {
                            value = controllar.siteNameController.text;
                          },
                          textEditingController: controllar.siteNameController,
                        ),
                        SizedBox(height: 10),
                        BuildInputText(
                          hintText: 'How many letters would you like?',
                          keyboardType: TextInputType.numberWithOptions(),
                          onChange: (value) {
                            value = controllar.lettersController.text;
                          },
                          textEditingController: controllar.lettersController,
                        ),
                        BuildInputText(
                          hintText: 'How many symbols would you like?',
                          keyboardType: TextInputType.number,
                          onChange: (value) {
                            value = controllar.symbolsController.text;
                          },
                          textEditingController: controllar.symbolsController,
                        ),
                        BuildInputText(
                          hintText: 'How many numbers would you like?',
                          keyboardType: TextInputType.number,
                          onChange: (value) {
                            value = controllar.numbersController.text;
                          },
                          textEditingController: controllar.numbersController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 50),
                    child: BuildButton(
                      buttonColor: Colors.white,
                      buttonTitle: 'Password Generator',
                      onPressed: () {
                        // 1# generator password
                        controllar.getRandomElements(
                          controllar.letters,
                          int.parse(controllar.lettersController.text),
                        );
                        controllar.getRandomElements(
                          controllar.symbols,
                          int.parse(controllar.symbolsController.text),
                        );
                        controllar.getRandomElements(
                          controllar.numbers,
                          int.parse(controllar.numbersController.text),
                        );
                        controllar.shufflePassword();
                        controllar.passwordToChar();
                        Get.bottomSheet(
                          Container(
                            height: size.height / 1,
                            width: size.width,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Container(
                                    height: 100,
                                    alignment: Alignment.center,
                                    color: Colors.black,
                                    child: Text(
                                      "${controllar.passwordChar}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BuildButton(
                                      buttonColor: Colors.lightBlueAccent,
                                      buttonTitle: 'Save',
                                      onPressed: () async {
                                        var site = Site({
                                          kSiteName: controllar
                                              .siteNameController.text,
                                          kLettersNums:
                                              controllar.lettersController.text,
                                          kSymbolsNums:
                                              controllar.symbolsController.text,
                                          kNumbersNums:
                                              controllar.numbersController.text,
                                          kSitePassword: controllar.passwordChar
                                        });

                                        int id = await controllar.dbHelper
                                            .createSite(site);
                                        print('Site id is : $id');
                                        print(
                                            'site name: ${controllar.siteNameController} ,letters: ${controllar.lettersController} ,symbols ${controllar.symbolsController} ,numbers ${controllar.numbersController}');

                                        print(
                                            'your password is : ${controllar.passwordChar} , length of list ${controllar.passwordChar.length} , length of list ${controllar.passwordList.length}');
                                        
                                        controllar.siteNameController.clear();
                                        controllar.lettersController.clear();
                                        controllar.symbolsController.clear();
                                        controllar.numbersController.clear();
                                        Navigator.pushNamed(
                                          context,
                                          HomeScreen.screen_route,
                                        );
                                      },
                                    ),
                                    BuildButton(
                                      buttonColor: Colors.amberAccent,
                                      buttonTitle: 'Copy',
                                      onPressed: () {
                                        controllar.copyToClipbord(
                                            controllar.passwordChar);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          enableDrag: false,
                          isDismissible: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
