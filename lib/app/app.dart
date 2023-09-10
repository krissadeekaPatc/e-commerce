import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:e_comerce/presentation/main/sections/cart/check_out/check_out_view.dart';
import 'package:e_comerce/presentation/main/sections/details/details_view.dart';
import 'package:e_comerce/presentation/resources/routes_manager.dart';
import 'package:e_comerce/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget { 
  MyApp._internal(); // private constructor
  int appState = 0;
 
  static final MyApp instance =  MyApp._internal(); // singleton instance -- singleton 

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      routes: {
        Routes.productDetails : (context) =>  const DetailsView(),
        Routes.checkoutPage :(context) => const CheckOutView()
      },
      debugShowCheckedModeBanner: true,
      title: FlavorConfig.instance.name ?? "NULL",
      theme: getApplicationTheme(),
    );
  }
}