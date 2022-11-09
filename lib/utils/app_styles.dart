import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor:
          isDarkTheme ? const Color(0xFF98A2B3) : const Color(0xFF667085),
      backgroundColor:
          isDarkTheme ? const Color(0xff000F24) : const Color(0xffffffff),
      // indicatorColor: isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xffEAECF0) : const Color(0xff667085),
      highlightColor:
          isDarkTheme ? const Color(0xffF2F4F7) : const Color(0xff1C1917),
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme,
      ),
      //hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      //focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      // disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      // cardColor: isDarkTheme ? Color(0xFF151515) : Color(0xFFE5E5E5),
      //canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      //brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //    colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      // appBarTheme: const AppBarTheme(elevation: 0.0),
    );
  }

  static TextStyle regularTextStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle detailsTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle headLine1TextStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
}