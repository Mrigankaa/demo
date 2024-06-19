import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obsecure;
  final Icon? prefixIcon;
  final IconButton? sufixIcon;
  final Text? label;
  final bool? readOnly;

  const MyTextWidget(
      {Key? key,
      this.controller,
      this.hintText,
      this.obsecure,
      this.prefixIcon,
      this.sufixIcon,
      this.readOnly,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          label: label,
          suffixIcon: sufixIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          filled: true,
          fillColor: Colors.grey[100],
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
