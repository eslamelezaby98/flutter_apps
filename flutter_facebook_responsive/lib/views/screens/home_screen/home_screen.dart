import 'package:flutter/material.dart';
import '../nav_screen/home_screen_desktop.dart';

import '../nav_screen/home_screen_mobile.dart';
import '../../widgets/responsive_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ResponsiveWidget(
          mobile: HomeScreenMobile(
            trackingScrollController: trackingScrollController,
          ),
          desktop: HomeScreenDesktop(
            trackingScrollController: trackingScrollController,
          ),
        ),
      ),
    );
  }
}
