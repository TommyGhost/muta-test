import 'package:babelos_app/utils/font_manager.dart';
import 'package:babelos_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/pallet.dart';
import '../utils/style_manager.dart';

class DropDownSelect extends StatelessWidget {
  final String hint;
  final String? value;
  final TextStyle? style;
  final Color? color;
  final bool noBorder;
  final List<DropdownMenuItem<String>>? dynamicItems;
  final List<String>? items;
  final IconData? icon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? onChanged;

  const DropDownSelect(
      {Key? key,
      required this.hint,
      required this.value,
      required this.items,
      required this.onChanged,
      this.dynamicItems,
      this.style,
      this.color,
      this.icon,
      this.noBorder = false,
      this.validator,
      this.autovalidateMode,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      margin: noBorder ? null : EdgeInsets.only(top: 10.h),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // noBorder
          //     ? 0.0.sbH
          //     : Text(hintText,
          //         style: getMediumStyle(
          //           fontSize: 14,
          //         )),
          // noBorder ? 0.0.sbH : 6.0.sbH,
          Container(
            alignment: Alignment.centerLeft,
            child: DropdownButtonFormField<String>(
              icon: Icon(
                icon ?? Icons.arrow_drop_down,
                color: color ?? Pallet.white.withOpacity(0),
                size: 24.r,
              ),
              value: value,
              items: dynamicItems ??
                  items!
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: style ??
                                  getBoldStyle(
                                    fontSize: FontSize.s16,
                                    height: 24.0.toFigmaHeight(16),
                                    color: Pallet.white,
                                  ),
                            ),
                          ))
                      .toList(),
              onChanged: onChanged,
              isExpanded: true,
              validator: validator,
              autovalidateMode: autovalidateMode,
              decoration: InputDecoration(
                errorMaxLines: 3,
                border: InputBorder.none,
                isDense: true,
                fillColor: Pallet.white,
                contentPadding: noBorder
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.w),
                hintText: hint,
                hintStyle: getRegularStyle(
                  fontSize: FontSize.s14,
                  color: Pallet.grey500,
                ),
                filled: noBorder ? false : true,
                focusedBorder: noBorder
                    ? const OutlineInputBorder(borderSide: BorderSide.none)
                    : OutlineInputBorder(
                        borderSide: const BorderSide(color: Pallet.secondary),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                enabledBorder: noBorder
                    ? const OutlineInputBorder(borderSide: BorderSide.none)
                    : OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Pallet.borderUnfocus),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                errorBorder: noBorder
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(color: Pallet.red),
                      )
                    : OutlineInputBorder(
                        borderSide: const BorderSide(color: Pallet.red),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                focusedErrorBorder: noBorder
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(color: Pallet.red),
                      )
                    : OutlineInputBorder(
                        borderSide: const BorderSide(color: Pallet.red),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
