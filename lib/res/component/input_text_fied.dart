// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSumbitedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFocus;

  const InputTextField(
      {super.key,
      required this.focusNode,
      this.autoFocus = true,
      this.enable = false,
      required this.hint,
      required this.keyBoardType,
      required this.myController,
      required this.obscureText,
      required this.onFieldSumbitedValue,
      required this.onValidator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.green,
      controller: myController,
      focusNode: focusNode,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSumbitedValue,
      validator: onValidator,
      keyboardType: keyBoardType,
    
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.primaryTextTextColor),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
