import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../controllers/language_cubit.dart';

const String dateTimeFormatPattern = 'yyyy-MM-dd hh:mm';
const String timeFormatPattern = 'hh:mm';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String resultDateString = "";

String getDeviceTimeZoneAndConvert({required String inputDateString}) {
  // Get the device's time zone
  String deviceTimeZone = getCurrentTimeZone();

  // Parse the input date string
  DateTime inputDate = DateTime.parse(inputDateString);

  // Add the time zone to the input date
  DateTime convertedDate = inputDate.toLocal();

  // Format the result date string
  String resultFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ";
  resultDateString = DateFormat(resultFormat).format(convertedDate);
  return resultDateString;
}

String getCurrentTimeZone() {
  // Get the current time zone
  DateTime now = DateTime.now();
  Duration offset = now.timeZoneOffset;
  String offsetSign = (offset.isNegative) ? "-" : "+";
  String timeZone =
      "$offsetSign${offset.inHours.abs().toString().padLeft(2, '0')}"
      ":${(offset.inMinutes.abs() % 60).toString().padLeft(2, '0')}";

  return timeZone;
}

String stringToDate(
    {required String text,
    String? locale,
    String pattern = timeFormatPattern}) {
  String inputWithTimeZone = getDeviceTimeZoneAndConvert(inputDateString: text);
  if (locale != null && locale.isNotEmpty) {
    initializeDateFormatting(locale);
  }
  String finalTime =
      DateFormat(pattern, locale).format(DateTime.parse(inputWithTimeZone));

  return finalTime;
}

String getMonthNameFromInt(int month) {
  final languageCubit =
      navigatorKey.currentState!.context.read<LanguageCubit>();

  return DateFormat.MMMM(languageCubit.local)
      .format(DateTime(DateTime.now().year, month));
}

String getMonthNameFromDate(String date) {
  return DateFormat.MMM().format(DateTime.parse(date));
}

String getDayNameFromDate(String date) {
  return DateFormat.E().format(DateTime.parse(date));
}

String getDayNumberFromDate(String date) {
  return DateFormat.d().format(DateTime.parse(date));
}

String getFullDate(String date) {
  String inputWithTimeZone = getDeviceTimeZoneAndConvert(inputDateString: date);

  return DateFormat.yMMMMd().format(DateTime.parse(inputWithTimeZone));
}

String getFullTime(String date) {
  String inputWithTimeZone = getDeviceTimeZoneAndConvert(inputDateString: date);

  return DateFormat.jm().format(DateTime.parse(inputWithTimeZone));
}
