import 'package:e_comerce/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
    name: "Udemy Course App",
    location: BannerLocation.bottomStart,
    variables: {
      "baseUrl": "https://www.example.com",
    },
  );
  runApp(MyApp());
}

