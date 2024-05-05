import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget>? actions;
  final void Function()? onTap;
  final double height;
  final Color? iconThemeColor;
  final Color? iconColor;
  final bool? showLeading;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Color? statusBarColor;
  final Brightness? statusBarBrightness;
  final Brightness? statusBarIconBrightness;

  const Navbar({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    this.actions,
    this.iconThemeColor,
    this.iconColor,
    this.showLeading,
    this.color,
    this.elevation,
    this.onTap,
    this.height = kToolbarHeight,
    this.padding,
    this.statusBarColor,
    this.statusBarBrightness,
    this.statusBarIconBrightness,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showLeading == true
          ? Padding(
            padding: padOnly(left: 17),
            child: BabInkWell(
                onTap: onTap ??
                    () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                child: Image.asset(
                  AppImages.backbutton,
                  width: 24.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
          )
          : null,
      // leadingWidth: 140.w,
      title: Text(title ?? "",
          style: getMediumStyle(
              fontSize: FontSize.s17, color: color ?? Pallet.secondary)),
      centerTitle: actions == null ? true : false,
      elevation: elevation ?? 2,
      backgroundColor: Pallet.bg,
      shadowColor: const Color(0xFFF4F3F3).withOpacity(0.26),
      surfaceTintColor: Pallet.bg,
      bottomOpacity: 0,
      toolbarHeight: height,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Pallet.bg,
          systemNavigationBarIconBrightness: Brightness.light),
      // actions: [
      //   Container(
      //     padding: padding ??
      //         const EdgeInsets.symmetric(
      //           horizontal: AppPadding.p20,
      //         ),
      //     height: height,
      //     width: title == null ? MediaQuery.of(context).size.width : 0,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         leading ?? const SizedBox(width: 0),
      //         trailing ?? const SizedBox(width: kToolbarHeight),
      //       ],
      //     ),
      //   )
      // ],
      actions: actions,
    );
  }
}
