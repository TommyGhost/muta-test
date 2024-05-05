import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader(
      {super.key, required this.value, required this.items, required this.onChanged});

  final String value;
  final List<String> items;
  final dynamic Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 155.w,
            child: DropDownSelect(
              hint: '',
              value: value,
              items: items,
              onChanged: onChanged,
            ),
          ),
          Row(
            children: [
              Image.asset(
                AppImages.notification,
                width: 22.w,
                height: 22.h,
                fit: BoxFit.cover,
              ),
              20.0.sbW,
              Image.asset(
                AppImages.profPic,
                width: 36.w,
                height: 36.h,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
