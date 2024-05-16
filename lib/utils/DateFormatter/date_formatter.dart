import 'package:intl/intl.dart';

///Date Dormatter
String formatDateTime(String isoString) {
  DateTime dateTime = DateTime.parse(isoString);
  // Formatea la hora y minutos.
  String time = DateFormat('h:mm').format(dateTime);

  // Determina manualmente si es AM o PM.
  String amPm = dateTime.hour >= 12 ? 'PM' : 'AM';

  // Combina la hora y minutos con AM o PM.
  String formattedString = '$time $amPm';
  return formattedString;
}