import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:propix8/core/theme/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.primaryLight,
    body: Center(
      child: Icon(
        Icons
            .home_work_outlined, // Replace with your app logo asset if available
        size: 100.sp,
        color: Colors.white,
      ),
    ),
  );
}
