import 'package:babelos_app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

import '../utils/pallet.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key, this.height, this.width, this.color = Colors.grey})
      : super(key: key);

  final double? height, width;
  final Color? color;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 16.0;

    return Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: radiusBoxDecoration(
          colors: [Colors.red, Pallet.green, Colors.purple, Colors.white],
          animation: _animation,
        ));
  }
}


class LanguageShimmerCart extends StatefulWidget {
  const LanguageShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageShimmerCart> createState() => _LanguageShimmerCartState();
}

class _LanguageShimmerCartState extends State<LanguageShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            // width: width(context),
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: const EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  margin: padOnly(down: 16, right: index.isEven ? 16 : 0),
                  height: 160.h,
                  width: 163.w,
                  child: const Skeleton(),
                );
              },
            ),
          );
        });
  }
}


