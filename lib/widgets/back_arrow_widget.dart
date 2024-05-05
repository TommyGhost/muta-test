import 'package:babelos_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 32.h,
          width: 32.w,
          child: Image.asset(
            AppImages.backbutton,
            width: 24.w,
            height: 16.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
