import 'package:e_comerce/presentation/forgot_password/forgot_password_view.dart';
import 'package:e_comerce/presentation/login/login_view.dart';
import 'package:e_comerce/presentation/main/main_view.dart';
import 'package:e_comerce/presentation/main/sections/details/details_view.dart';
import 'package:e_comerce/presentation/onboarding/onboarding_view.dart';
import 'package:e_comerce/presentation/register/register_view.dart';
import 'package:e_comerce/presentation/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String productDetails = "/productDetails";
  static const String checkoutPage = "/checkoutPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.productDetails:
        return MaterialPageRoute(
          builder: (_) => const DetailsView(),
        );
      default:
      return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route found"),
              ),
              body: const Center(child: Text("No Route found")),
            ));
  }
}