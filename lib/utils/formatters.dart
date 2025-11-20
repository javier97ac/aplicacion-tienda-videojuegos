import 'package:intl/intl.dart';

final NumberFormat eurFormat = NumberFormat.simpleCurrency(locale: 'es_ES', name: 'EUR');

String formatCurrency(num value) {
  try {
    return eurFormat.format(value);
  } catch (e) {
    return '€${value.toStringAsFixed(2)}';
  }
}
