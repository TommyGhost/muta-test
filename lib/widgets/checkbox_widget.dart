import 'package:babelos_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabCheckBox extends StatelessWidget {
  final Function(bool?) onChanged;
  final bool value;
  const BabCheckBox({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 21.w,
      height: 21.h,
      child: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Pallet.orange,
          checkColor: Pallet.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    );
  }
}


// GestureDetector(
//       onTap: (){
//         onChanged(!value);
//       },
//       child: Container(
//         height: 60.h,
//         margin: EdgeInsets.only(bottom: 14.h),
//         padding: pad(vert: 16, horiz: 12),
//         decoration: BoxDecoration(
//           border: Border.all(color: Pallet.greyTransC),
//           borderRadius: BorderRadius.circular(5.r)
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 21.w,
//               height: 0.h,
//               child: Transform.scale(
//                 scale: 1.2,
//                 child: Checkbox(
//                   value: value,
//                   onChanged: onChanged,
//                   activeColor: Pallet.orange,
//                   checkColor: Pallet.white,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
//                 ),
//               ),
//             ),
//             12.0.sbW,
//             Text(text, style: getRegularStyle(fontSize: FontSize.s17)),
//           ],
//         ),
//       ),
//     );