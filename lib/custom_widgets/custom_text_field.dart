
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.text, required this.con, Key? key})
      : super(key: key);
  final String text;
  final TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: con,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        labelText: text,
      ),
    );
  }
}
