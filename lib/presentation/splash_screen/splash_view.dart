import 'dart:async';
import 'package:e_comerce/presentation/resources/color_manager.dart';
import 'package:e_comerce/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  late Timer _timer;

  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNextPage);
  }

  _goNextPage(){
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }
  
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#1e2db3'),
      body: Center(
        child: FaIcon(
          FontAwesomeIcons.shop,
          color: ColorManager.white,
          size: 100,
        ),
      ),
    );
  }
}
