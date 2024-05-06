import 'package:babelos_app/utils/pallet.dart';
import 'package:babelos_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/font_manager.dart';
import '../../../utils/style_manager.dart';
import '../../base/base_ui.dart';
import 'bottom_nav.vm.dart';
import 'components/bottom_nav_bars.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  // final String? text;
  const BottomNav({
    super.key,
    required this.selectedIndex,
    // required this.text,
  });

  @override
  _BottomNavState createState() => _BottomNavState();
}

final ValueNotifier<int> pageIndex = ValueNotifier(0);

class _BottomNavState extends State<BottomNav> {
  // void next() async {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await Future.delayed(const Duration(seconds: 5));
  //     FireBaseApi().initNotifications();
  //
  //   });
  // }

  @override
  void initState() {
    // next();
    pageIndex.value = widget.selectedIndex;
    // BottomNavViewModel.text = widget.text;
    super.initState();
  }

  void _onNavigationItem(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavViewModel>(
      onModelReady: (model) {
        // print('model.text: ${BottomNavViewModel.text}');
        // print('widget.text: ${widget.text}');
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(seconds: 5));
        });
      },
      builder: (context, model, child) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (pageIndex.value != 0) {
            // If the current index is not 0, set the index to 0 and don't close the app
            setState(() {
              pageIndex.value = 0;
            });
            // return false;
          } else {
            // If the current index is 0, close the app
            _closeApp(context);
            // return false;
          }
        },
        child: Scaffold(
          // backgroundColor: AppColors.background,
          body: ValueListenableBuilder(
              valueListenable: pageIndex,
              builder: (BuildContext context, int value, _) {
                return model.children[value];
              }),
          bottomNavigationBar: BottomNavBar(
            onItemSelected: _onNavigationItem,
            selectedIndex:
                pageIndex.value, //change selected tabbar when navigated to
          ),
        ),
      ),
    );
  }

  void _closeApp(BuildContext context) {
    // bool _isShown = true;
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
              backgroundColor: Pallet.white,
              actionsPadding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
              title: Text(
                AppStrings.closeApp,
                style: getSemiBoldStyle(
                  fontSize: FontSize.s18,
                ),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                  height: 130.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppStrings.closeAppDetails,
                        style: getRegularStyle(
                          fontSize: FontSize.s14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      1.0.sbH,
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  backgroundColor: Pallet.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.r))),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No',
                                    style: getBoldStyle(
                                      color: Pallet.white,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.0.sbW,
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.r))),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('token');
                                pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Yes',
                                    style: getBoldStyle(
                                      color: Pallet.white,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )));
        });
  }

  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
