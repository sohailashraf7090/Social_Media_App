// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../../res/component/input_text_fied.dart';
import '../../res/component/round_button.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to the Social Media App",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    "Enter Your email & Password\n to Connect Your Account",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  Form(
                      key: _form,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height * .03),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * .02,
                            ),
                            InputTextField(
                              focusNode: emailFocusNode,
                              hint: "Email",
                              keyBoardType: TextInputType.emailAddress,
                              obscureText: false,
                              enable: true,
                              myController: emailController,
                              onFieldSumbitedValue: (value) { Utils.onFieldFocus(
                                    context, emailFocusNode, passwordFocusNode);},
                              onValidator: (value) {
                                return value.isEmpty ? 'Enter Email' : null;
                              },
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            InputTextField(
                              focusNode: passwordFocusNode,
                              hint: "Password",
                              keyBoardType: TextInputType.emailAddress,
                              obscureText: false,
                              enable: true,
                              myController: passwordController,
                              onFieldSumbitedValue: (value) {},
                              onValidator: (value) {
                                return value.isEmpty ? 'Enter Password' : null;
                              },
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  RoundButton(
                    title: "Login",
                    onPress: () {},
                    loading: false,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("Don't have an account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteName.signupScreen);
                        },
                        child: const Text("Sign Up?"))
                  ])
                ]),
          ),
        ),
      ),
    );
  }
}
