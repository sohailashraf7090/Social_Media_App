// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utils.dart';
import 'package:tech_media/view/signup/signup_controller.dart';

import '../../res/component/input_text_fied.dart';
import '../../res/component/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameController.dispose();
    userNameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Screen"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ChangeNotifierProvider(
              create: (context) => SignUpController(),
              child: Consumer<SignUpController>(
                  builder: (context, provider, child) {
                return SingleChildScrollView(
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
                          "Enter Your email & Password\n For Register Yourself",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                        Form(
                            key: _form,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * .03),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * .02,
                                  ),
                                  InputTextField(
                                    focusNode: userNameFocusNode,
                                    hint: "User Name",
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    enable: true,
                                    myController: userNameController,
                                    onFieldSumbitedValue: (value) {},
                                    onValidator: (value) {
                                      return value.isEmpty
                                          ? 'Enter User Name'
                                          : null;
                                    },
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  InputTextField(
                                    focusNode: emailFocusNode,
                                    hint: "Email",
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    enable: true,
                                    myController: emailController,
                                    onFieldSumbitedValue: (value) {
                                      Utils.onFieldFocus(context,
                                          emailFocusNode, passwordFocusNode);
                                    },
                                    onValidator: (value) {
                                      return value.isEmpty
                                          ? 'Enter Email'
                                          : null;
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
                                      return value.isEmpty
                                          ? 'Enter Password'
                                          : null;
                                    },
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 10),
                        RoundButton(
                          title: "Sign Up",
                          onPress: () {
                            if (_form.currentState!.validate()) {
                              provider.signUp(
                                  userNameController.text.toString(),
                                  emailController.text.toString(),
                                  passwordController.text.toString());
                            }
                          },
                          loading: provider.loading,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("already have an account"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.loginScreen);
                                  },
                                  child: const Text("Login?"))
                            ])
                      ]),
                );
              }),
            )),
      ),
    );
  }
}
