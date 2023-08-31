import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../../utils/colors.dart';

class UtilClass {
  static Future<void> showAlertDialog(
      BuildContext context, String message, String route) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: bgColor,
          content: Center(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (message == "success") {
                  Routemaster.of(context).push(route);
                } else {
                  Routemaster.of(context).pop();
                }
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}
