// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.suffixWidget,
    this.obscure,
    this.textEditingController,
    this.labelWidget,
    this.changeFunc,
  }) : super(key: key);

  final String? hint;
  final Widget? suffixWidget;
  final bool? obscure;
  final TextEditingController? textEditingController;
  final Widget? labelWidget;
  final Function(String)? changeFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(onChanged: changeFunc,
        controller: textEditingController,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          label: labelWidget,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          filled: true, fillColor: Colors.grey.shade200,
          // border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          hintText: hint,
          suffixIcon: suffixWidget,
        ),
      ),
    );
  }
}
