import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String label;
  final int maxLines;
  bool? obscureText;
  TextInputType? textInputType;
  TextEditingController controller;
  TextFormWidget(
      {Key? key,
      required this.label,
      required this.maxLines,
      required this.controller,
      this.obscureText,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffF7F7FA)),
            borderRadius: const BorderRadius.all(Radius.circular(15.0))),
        child: TextFormField(
          controller: controller,
          minLines: 1,
          maxLines: maxLines,
          obscureText: obscureText ?? false,
          keyboardType: textInputType ?? TextInputType.text,
          // scrollPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            label: Text(label),
          ),
          // decoration: InputDecoration(
          //     label: Text(label),
          //     border: const OutlineInputBorder(
          //         borderSide: BorderSide(color: Color(0xffF7F7FA), width: 6),
          //         borderRadius: BorderRadius.all(Radius.circular(15.0)))),
        ),
      ),
    );
  }
}
