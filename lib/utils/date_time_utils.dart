import 'package:easy_localization/easy_localization.dart';

class DateTimeUtils {

  static formatToDate(date){
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }

  static formatToTime(date){
    return DateFormat('HH:mm:ss').format(DateTime.parse(date));
  }

  static formatToDateTime(date){
    return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(date));
  }
}