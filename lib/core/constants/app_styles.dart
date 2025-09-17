import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static final TextStyle logocolor = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldBlackText = TextStyle(
    color: AppColors.blackColor,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle w600DarkGrayText = TextStyle(
    color: AppColors.darkGray,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  // static final TextStyle appBarText = TextStyle(
  //   color: AppColors.blackColor,
  //   fontSize: 22,
  //   fontWeight: FontWeight.bold,
  // );

  static final TextStyle bodytext = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle buttonText = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
}
