import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.textController,
    required this.hintText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontFamily: 'Lili',
              color: const Color.fromARGB(255, 221, 220, 220)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
