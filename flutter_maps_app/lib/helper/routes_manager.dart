import 'package:flutter/material.dart';
import 'package:flutter_maps_app/view/auth_screen/phone_auth_screen.dart';
import 'package:flutter_maps_app/view/auth_screen/otp_screen.dart';
import 'package:flutter_maps_app/view/map_screen/map_screen.dart';

class Routes {
  static const String authScreen = '/auth_screen';
  static const String otpScreen = '/otp_screen';
  static const String mapScreen = '/mapScreen';
}

class GenerateRoutes {
  Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authScreen:
        return MaterialPageRoute(
          builder: (context) => const PhoneAuthScreen(),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) => const OTPScreen(),
        );
        case Routes.mapScreen:
        return MaterialPageRoute(
          builder: (context) => const MapScreen(),
        );
      default:
        undefindRoute();
    }
  }

  static undefindRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Error'),
      ),
    );
  }
}
