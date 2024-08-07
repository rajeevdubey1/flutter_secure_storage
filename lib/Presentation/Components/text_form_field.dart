import 'package:flutter/material.dart';
import '../Declarations/constants.dart';

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr({
    super.key, required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: primaryColor,
        ),
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        labelText: "Enter Data",
        labelStyle: TextStyle(color: primaryColor),
      ),
    );
  }
}
