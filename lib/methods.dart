import 'package:flutter/material.dart';

Future<void> selectDate(
    {required BuildContext context, required TextEditingController dateController}) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );
  if (selectedDate != null) {
          dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      }
}