import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? hintText;
  final Function(String? value) onChanged;
  const TextfieldWidget({Key? key, this.hintText, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.grey[600],
        style: TextStyle(color: Colors.grey[600]),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
