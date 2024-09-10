import 'package:flutter/material.dart';
import 'package:mondoli_test/resource/resources.dart';

class StyleTextFormField {
  static InputDecoration outlineInputBorder() {
    //set style
    var styleOutlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.primaryGreyColor,
        width: 1,
      ),
    );

    var styleOutlineInputErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.primaryRedColor,
        width: 1,
      ),
    );

    // return the decoration
    return InputDecoration(
      enabledBorder: styleOutlineInputBorder,
      focusedBorder: styleOutlineInputBorder,
      disabledBorder: styleOutlineInputBorder,
      errorBorder: styleOutlineInputErrorBorder,
      focusedErrorBorder: styleOutlineInputErrorBorder,
      errorStyle: const TextStyle(
        color: AppColors.primaryRedColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      labelStyle: const TextStyle(
        color: AppColors.primaryDarkGreyColor,
        fontFamily: 'HelveticaNeue',
        fontSize: 14,
      ),
    );
  }

  static InputDecoration searchRoundedGrey({
    String hint = "",
    Color fillColor = AppColors.secondaryLightGreyColor,
  }) {
    var styleOutlineInputBorder = const OutlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.secondaryLightGreyColor, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    );

    return InputDecoration(
      fillColor: fillColor,
      hoverColor: AppColors.secondaryLightGreyColor,
      focusColor: AppColors.secondaryLightGreyColor,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      hintText: hint,
      hintStyle: const TextStyle(
        color: AppColors.primaryDarkGreyColor,
        fontSize: 12,
        fontFamily: 'HelveticaNeue',
      ),
      suffixIcon: const Icon(
        Icons.search,
        color: AppColors.primaryDarkGreyColor,
      ),
      border: styleOutlineInputBorder,
      focusedBorder: styleOutlineInputBorder,
      enabledBorder: styleOutlineInputBorder,
    );
  }

  static InputDecoration inputDecorNoBorder(String hint) {
    return InputDecoration(
      fillColor: const Color(0xFFF1F1F1),
      hoverColor: const Color(0xFFF1F1F1),
      focusColor: const Color(0xFFF1F1F1),
      filled: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black26),
      errorStyle: const TextStyle(
          color: Color(0xFFFAFF00),
          fontWeight: FontWeight.w600,
          fontSize: 10,
          fontFamily: "HelveticaNeue"),
      helperStyle: const TextStyle(
          color: Color(0xFFFAFF00),
          fontWeight: FontWeight.w600,
          fontSize: 10,
          fontFamily: "HelveticaNeue"),
    );
  }
}
