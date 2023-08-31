import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool isPassword;
  const InputTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: deviceSize.width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 44, 43, 43),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                title,
                // textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controller,
                obscureText: isPassword,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: bgColor,
                  filled: true,
                  hintText: hintText,
                  errorStyle: const TextStyle(color: errTextColor),
                  hintStyle: const TextStyle(color: secondaryColor),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: bgColor, width: 2),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: bgColor, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController controller;
  const EmailInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: deviceSize.width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 44, 43, 43),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                'Email',
                // textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "This field is required";
                  }
                  if (!controller.text.toString().contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  fillColor: bgColor,
                  filled: true,
                  hintText: 'Enter your email address',
                  errorStyle: TextStyle(color: errTextColor),
                  hintStyle: TextStyle(color: secondaryColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: bgColor, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bgColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bgColor, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
