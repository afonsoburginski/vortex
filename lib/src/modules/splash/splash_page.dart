import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vortex/shared/themes/app_colors.dart';
import 'package:vortex/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   final authController = AuthController();
    //   authController.currentUser(context);
    return Scaffold(
      //   backgroundColor: AppColors.primary,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff001120), Color(0xff001120)],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.vortexLogoDegrade,
            height: 90,
            width: 90,
          ),
        ),
      ),
    );
  }
}
