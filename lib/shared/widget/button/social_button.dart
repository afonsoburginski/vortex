import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vortex/shared/themes/app_colors.dart';
import 'package:vortex/shared/themes/app_images.dart';
// import 'package:vortex/shared/themes/app_text_style.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              AppImages.apple,
              height: 32,
              width: 32,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/barcode_scanner");
              },
              child: SizedBox(
                  height: 56,
                  child: Expanded(
                    child: SvgPicture.asset(
                      AppImages.google,
                      height: 32,
                      width: 32,
                    ),
                  )),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
            )
          ],
        ),
      ),
      // child: Container(
      //   height: 56,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       SvgPicture.asset(
      //         AppImages.google,
      //         height: 32,
      //         width: 32,
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.pushNamed(context, "/barcode_scanner");
      //         },
      //         child: Container(
      //             height: 48,
      //             width: 48,
      //             decoration: BoxDecoration(
      //                 color: AppColors.primary,
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: Expanded(
      //               child: SvgPicture.asset(
      //                 AppImages.google,
      //                 height: 32,
      //                 width: 32,
      //                 color: AppColors.background,
      //               ),
      //             )),
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.description_outlined,
      //           color: AppColors.body,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
