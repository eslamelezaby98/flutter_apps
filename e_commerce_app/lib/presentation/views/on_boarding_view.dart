import 'package:e_commerce_app/presentation/app_manager/color_manager.dart';
import 'package:flutter/material.dart';

class OnBoradingView extends StatelessWidget {
  const OnBoradingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Center(
        child: Text('Welcome to onBording screen'),
      ),
    );
  }
}
