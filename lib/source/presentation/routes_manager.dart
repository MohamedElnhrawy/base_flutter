
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String otpRoute = '/otpRoute';
  static const String registerRoute = '/registerRoute';
  static const String homeRoute = '/homeRoute';
  static const String onBoardingRoute = '/onBoardingRoute';
  static const String nearbyPlacesRoute = '/nearbyPlacesRoute';
  static const String orderDetailsRoute = '/orderDetailsRoute';
  static const String orderPaymentRoute = '/orderPaymentRoute';
  static const String cartRoute = '/cartRoute';
  static const String completeOrderRoute = '/completeOrderRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {

      default:
        return UnDefinedRoute();
    }
  }

  static MaterialPageRoute UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('no route'),
              ),
              body: Center(
                child: Text('no route'),
              ),
            ));
  }
}
