import 'package:flutter/services.dart';


//Формат для даты
class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (text.length > 0 && !text.contains('/')) {
      // Форматируем ввод даты (DDMMYYYY)
      final nonFormattedText = text.replaceAll(RegExp(r'\D'), '');
      if (nonFormattedText.length > 4) {
        text = nonFormattedText.substring(0, 2) +
            '/' +
            nonFormattedText.substring(2, 4) +
            '/' +
            nonFormattedText.substring(4);
      } else if (nonFormattedText.length > 2) {
        text = nonFormattedText.substring(0, 2) +
            '/' +
            nonFormattedText.substring(2);
      } else {
        text = nonFormattedText;
      }
    }
    if (text.length == 10) {
      text += 'г';
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}