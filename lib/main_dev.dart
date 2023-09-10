import 'package:e_comerce/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
    name: "[DEV] Udemy Course App",
    location: BannerLocation.bottomStart,
    color: Colors.red,
    variables: {
      "baseUrl": "https://dev-www.example.com",
    },
  );
  return runApp(MyApp());
}

