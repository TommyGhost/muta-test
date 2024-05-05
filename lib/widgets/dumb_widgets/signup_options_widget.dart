import 'package:babelos_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpOptionsCard extends StatelessWidget {
  const SignUpOptionsCard({super.key, required this.google});

  final bool google;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pad(horiz: 24, vert: 12),
      margin: padOnly(down: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Pallet.white,
      ),
      child: Row(
        children: [
          Image.asset(
            google ? AppImages.google : AppImages.facebook,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.cover,
          ),
          32.0.sbW,
          Text(
            google ? AppStrings.signUpG.toUpperCase() : AppStrings.signUpF.toUpperCase(),
            style: getBoldStyle(
                fontSize: FontSize.s14,
                height: 24.0.toFigmaHeight(14),
                color: Pallet.outlineBorder2),
          ),
        ],
      ),
    );
  }
}
