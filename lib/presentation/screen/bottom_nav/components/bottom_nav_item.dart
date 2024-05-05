import 'package:babelos_app/utils/pallet.dart';
import 'package:babelos_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/font_manager.dart';
import '../../../../utils/style_manager.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.index,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  final String label;
  final String icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      // margin: EdgeInsets.only(bottom: 2.h),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(100.r),
          //     color: isSelected
          //         ? Pallet.green.withOpacity(0.1)
          //         : Colors.transparent),
          // color: Theme.of(context).backgroundColor,
          height: 48.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 24.h,
                width: 24.w,
                // color: isSelected
                //     ? Pallet.green
                //     : Theme.of(context)
                //         .bottomNavigationBarTheme
                //         .unselectedItemColor,
              ),
              4.0.sbH,
              Text(
                label,
                style: getRegularStyle(
                  fontSize: FontSize.s12,
                  height: 16.0.toFigmaHeight(12),
                  color: isSelected
                      ? Pallet.primary
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
