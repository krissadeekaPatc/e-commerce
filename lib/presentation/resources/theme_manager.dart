import 'package:e_comerce/presentation/resources/color_manager.dart';
import 'package:e_comerce/presentation/resources/font_manager.dart';
import 'package:e_comerce/presentation/resources/styles_manager.dart';
import 'package:e_comerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.black,
    ),
    
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        ),
    ),
    
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        )
      ),
    ),

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s16,
        ),
      titleMedium: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(color: ColorManager.grey1),
      bodyLarge: getRegularStyle(color: ColorManager.grey)
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:  getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.s1_5,
          color: ColorManager.grey,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.s1_5,
          color: ColorManager.primary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.s1_5,
          color: ColorManager.error,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.s1_5,
          color: ColorManager.primary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),

  );
}
