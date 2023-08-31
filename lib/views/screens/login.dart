import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:task_flow_mobile/views/widgets/input_field.dart';

import '../widgets/app_btn.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  static const routeName = '/login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _signupUser() async {
    final formValidator = _formKey.currentState?.validate();
    if (!formValidator!) return;
    _formKey.currentState?.save();
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    final signinMap = {
      'email': emailController.text.toString().trim(),
      'password': passwordController.text.toString().trim(),
    };
    print(signinMap);

    // try {

    // await AuthService.userSignup(signupData: signupMap);
    // } catch (e) {

    // }

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Task Flow'),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Welcome Back!", style: TextStyle(fontSize: 18)),
                  SizedBox(height: deviceSize.height * 0.07),
                  EmailInput(
                    controller: emailController,
                  ),
                  InputTextField(
                    title: 'Password',
                    controller: passwordController,
                    hintText: 'Enter password',
                    isPassword: true,
                  ),
                  SizedBox(height: deviceSize.height * 0.03),
                  CustomButton(
                    onTap: _signupUser,
                    placeholder: loading
                        ? const CircularProgressIndicator()
                        : const Text('Sign In'),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account? '),
                      TextButton(
                        onPressed: () {
                          Routemaster.of(context).pop();
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
