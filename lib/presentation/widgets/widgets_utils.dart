
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_comerce/presentation/resources/color_manager.dart';
import 'package:e_comerce/presentation/resources/font_manager.dart';

Widget defaultText(
    String value,
    {
      required double size,
      TextAlign textAlign = TextAlign.center,
      TextOverflow? overflow,
      int? maxLines,
      FontWeight weight = FontWeight.normal,
      String? fontFamily,
      FontStyle fontStyle = FontStyle.normal,
      String color = "#000000",
      TextDecoration decoration = TextDecoration.none,
      bool autoSizeText = true
    }) {


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      for(String text in value.split("\n"))
        defaultTextOiginal(
            text,
            size: size,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
            weight: weight,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            color: color,
            decoration: decoration,
            autoSizeText: autoSizeText
        )
    ],
  );
}

Widget defaultTextOiginal(
    String value,
    {
      required double size,
      TextAlign textAlign = TextAlign.center,
      TextOverflow? overflow,
      int? maxLines,
      FontWeight weight = FontWeight.normal,
      String? fontFamily,
      FontStyle fontStyle = FontStyle.normal,
      String color = "#000000",
      TextDecoration decoration = TextDecoration.none,
      bool autoSizeText = true
    }) {

  final textStyle = TextStyle(
    fontSize: fontFamily == null ? size : size,
    fontWeight: weight,
    fontFamily: fontFamily ?? FontConstants.fontFamily,
    fontStyle: fontStyle,
    color: HexColor(color),
    decoration: decoration,
  );
  if (!autoSizeText) {
    return Text(
      value,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: textStyle,
    );
  }
  return AutoSizeText(
    value,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style: textStyle,
  );
}



  Widget defaultButton(
    BuildContext context, {
    required Function() onPressed,
    String title = 'title',
    double fontSize = 16,
    String fontColor = "#FFFFFF",
  }) {
  return Container(
    margin: const EdgeInsets.all(30),
    height: 50,
    child: CupertinoButton(
      color: ColorManager.black,
      onPressed: onPressed,
      child: Center(
        child: defaultText(
          title,
          size: fontSize,
          color: fontColor,
        ),
      ),
    ),
  );
}


Widget defaultImageNetwork(String imageUrl,{
  double width = 100,
  double height = 100,
}) {
  return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error));
}
