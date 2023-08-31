import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget placeholder;
  const CustomButton(
      {required this.onTap, required this.placeholder, super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: textColor,
        minimumSize: Size(
          deviceSize.width * 0.97,
          deviceSize.height * 0.06,
        ),
      ),
      child: placeholder,
    );
  }
}
