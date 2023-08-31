import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:task_flow_mobile/services/auth_services.dart';
import 'package:task_flow_mobile/views/screens/home.dart';
import 'package:task_flow_mobile/views/screens/login.dart';
import 'package:task_flow_mobile/views/widgets/alert_dialog.dart';
import 'package:task_flow_mobile/views/widgets/input_field.dart';

import '../widgets/app_btn.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool sendingEmail = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  _signupUser() async {
    final formValidator = _formKey.currentState?.validate();
    if (!formValidator!) return;
    _formKey.currentState?.save();
    if (!mounted) return;
    setState(() {
      sendingEmail = true;
    });
    final signupMap = {
      'password': passwordController.text.trim(),
      'password2': confirmPasswordController.text.trim(),
      'email': emailController.text.trim(),
      'first_name': firstNameController.text.trim(),
      'last_name': lastNameController.text.trim(),
    };

    final res = await AuthService.userSignupUser(signupData: signupMap);

    setState(() {
      sendingEmail = false;
    });
    // ignore: use_build_context_synchronously
    UtilClass.showAlertDialog(
      context,
      res,
      HomeScreen.routeName,
    );
    return res;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Flow'),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Sign Up", style: TextStyle(fontSize: 18)),
                InputTextField(
                  title: 'First Name',
                  controller: firstNameController,
                  hintText: 'Enter first name',
                ),
                InputTextField(
                  title: 'Last Name',
                  controller: lastNameController,
                  hintText: 'Enter last name',
                ),
                EmailInput(
                  controller: emailController,
                ),
                InputTextField(
                  title: 'Password',
                  controller: passwordController,
                  hintText: 'Enter password',
                  isPassword: true,
                ),
                InputTextField(
                  title: 'Confirm Password',
                  controller: confirmPasswordController,
                  hintText: 'Enter password again',
                  isPassword: true,
                ),
                SizedBox(height: deviceSize.height * 0.03),
                CustomButton(
                  onTap: _signupUser,
                  placeholder: sendingEmail
                      ? const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            value: 12,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Continue'),
                ),
                SizedBox(height: deviceSize.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    TextButton(
                      onPressed: () {
                        Routemaster.of(context).push(SigninScreen.routeName);
                      },
                      child: const Text('Sign in'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
