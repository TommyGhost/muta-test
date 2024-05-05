// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class KeyboardAware extends StatelessWidget {
  final Widget? child;
  const KeyboardAware({this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: child);
  }
}
