import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _appConfig = FlavorConfig.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome to on-boarding ${_appConfig.name}")),
    );
  }
}