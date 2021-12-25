import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_controller.dart';
import 'package:flutter_maps_app/helper/routes_manager.dart';
import 'package:flutter_maps_app/view/auth_screen/local_widgets/local_widget.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TopSection(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    const Text('Do\'t recieve a code yet!'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _addAction('Resend code'),
                        SizedBox(
                          height: 20,
                          width: 2,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        _addAction('Change phone number'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _addAction(String title) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(context);
    return Column(
      children: [
        LocalWidget.buildHeaderText('Verfiy your phone number?'),
        const SizedBox(height: 20),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Enter your 6 digits code numbers sent to you at ',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              TextSpan(
                text: '+0201063374212',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 100,
            child: TextFormField(
              controller: provider.codeController,
              cursorColor: Colors.black,
              autofocus: true,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'xxx xxx',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
              onChanged: provider.onCodeChange,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your phone number";
                } else if (value.length < 6) {
                  return "Your phone number is less than 11 numbers!";
                } else if (value.length < 6) {
                  return "Your phone number too long!";
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 50),
        // custom button.
        FloatingActionButton(
          onPressed: () async {
            await provider.submitCode();
            showProgressIndicaator(context);
            Navigator.pushNamed(context, Routes.mapScreen);
          },
          child: const Icon(Icons.forward),
        )
      ],
    );
  }

  showProgressIndicaator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}


  // process
    // user input code
    // check code is validation
    // validation TextForm
    // if code is correct => move to home_screen
    // if code is not correct => show snakbar.