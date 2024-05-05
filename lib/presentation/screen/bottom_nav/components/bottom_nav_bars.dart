import 'package:babelos_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bottom_nav_item.dart';

/* The Custom Navigation Bars */

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.onItemSelected,
    required this.selectedIndex,
  }) : super(key: key);

  //handles the state changes
  final ValueChanged<int> onItemSelected;
  int selectedIndex;

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  //handles selections between the screens
  void handleItemSelected(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        border: const Border(
          top: BorderSide(color: Pallet.outlineBorder),
        ),
      ),
      padding: EdgeInsets.only(top: 0.h),
      child: SafeArea(
        top: true,
        bottom: true,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationBarItem(
                icon: widget.selectedIndex == 0
                    ? AppImages.home
                    : AppImages.home,
                label: AppStrings.home,
                isSelected: (widget.selectedIndex == 0),
                index: 0,
                onTap: handleItemSelected,
              ),
              NavigationBarItem(
                icon: widget.selectedIndex == 1
                    ? AppImages.book2
                    : AppImages.book2,
                label: AppStrings.learn,
                isSelected: (widget.selectedIndex == 1),
                index: 1,
                onTap: handleItemSelected,
              ),
              NavigationBarItem(
                icon: widget.selectedIndex == 2
                    ? AppImages.live
                    : AppImages.live,
                label: AppStrings.liveSess,
                isSelected: (widget.selectedIndex == 2),
                index: 2,
                onTap: handleItemSelected,
              ),              
            ]),
      ),
    );
  }
}
