import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

String getImagePath({required String id}) =>
    "${dotenv.env['API_BASE_URL']}/images/$id";

final NumberFormat _currencyFormat = NumberFormat.currency(
  locale: 'fr_FR',
  symbol: 'FCFA',
  decimalDigits: 0,
);

String formatPrice(String value) {
  if (value.isEmpty) return '';
  value = value.replaceAll(RegExp(r'\D'), '');
  int parsedValue = int.tryParse(value) ?? 0;
  return _currencyFormat.format(parsedValue).replaceAll('FCFA', '').trim();
}

void onPriceFromChanged({
  required String value,
  required TextEditingController textEditingController,
}) {
  String formatted = formatPrice(value);
  textEditingController.value = TextEditingValue(
    text: formatted,
    selection: TextSelection.collapsed(offset: formatted.length),
  );
}
