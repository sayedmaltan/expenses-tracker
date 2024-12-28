import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController textControllerAMOUNT,
    required this.hintText,
     this.textInputType=TextInputType.text,  this.onTap,
  }) : _textControllerAMOUNT = textControllerAMOUNT;

  final TextEditingController _textControllerAMOUNT;
  final String hintText;
  final TextInputType textInputType;
  final GestureTapCallback ?onTap;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: textInputType,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF2D6A4F),
              )
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          )
      ),
      style: const TextStyle(
        color: Color(0xFF2D6A4F),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Enter an amount';
        }
        return null;
      },
      controller: _textControllerAMOUNT,
    );
  }
}
