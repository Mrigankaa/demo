import 'package:flutter/material.dart';
import 'package:garagewa/core/theme/pallet.dart';

class MyButton extends StatelessWidget {
  final void Function() onTap;
  final Widget child;

  const MyButton({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPallet.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onTap,
          child: child),
    );
  }
}
