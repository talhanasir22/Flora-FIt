import 'dart:ui';

import 'package:florafit_app/Core/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText{

  static TextStyle splashPageTextStyle(){
    return GoogleFonts.libreCaslonText(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Color(0xFFA11D20),
    );
  }
  static TextStyle onboardingHeadingStyle(){
    return GoogleFonts.montserrat(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle onboardingDescStyle(){
    return GoogleFonts.montserrat(
      fontSize: 14,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle authHeadingStyle(){
    return GoogleFonts.montserrat(
      fontSize: 36,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle authHintTextStyle(){
    return GoogleFonts.montserrat(
      fontSize: 12,
      color: Color(0xff676767),
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle buttonTextStyle(){
    return GoogleFonts.montserrat(
      fontSize: 20,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle navSelectedLabelTextStyle(){
    return GoogleFonts.montserrat(
      fontSize: 11,
      color: AppColors.bgColor,
    );
  }
  static TextStyle navUnSelectedLabelTextStyle(){
    return GoogleFonts.montserrat(
      fontSize: 10,
      color: Colors.grey,
      fontWeight: FontWeight.w400
    );
  }
  static TextStyle mainHeadingTextStyle(){
    return GoogleFonts.montserrat(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w600
    );
  }
}