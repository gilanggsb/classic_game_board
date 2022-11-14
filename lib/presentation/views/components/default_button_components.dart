import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class DefaultButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const DefaultButtonComponent({super.key, required this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      child: Text(title),
    );
  }
}