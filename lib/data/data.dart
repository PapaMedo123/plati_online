import 'package:flutter/material.dart';
import 'package:plati_online/data/icon.dart';

/// Singleton class that holds a list of [AppIcon] objects representing application icons.
class AppData {
  /// Private constructor for the [AppData] class to implement the singleton pattern.
  AppData._internal();

  /// The singleton instance of [AppData].
  static final AppData _instance = AppData._internal();

  /// Factory constructor to provide access to the singleton instance of [AppData].
  factory AppData() => _instance;

  /// A list of [AppIcon] objects representing application icons.
  List<AppIcon> list = [
    // Example AppIcon instances
    AppIcon(
      Image.asset('assets/images/T-Mobile_logo_2022.svg.png'),
      "Tmobile",
      Uri.parse("https://www.telekom.mk/plationline/"),
    ),
    AppIcon(
      Image.asset('assets/images/a1_logo.jpg'),
      "A1",
      Uri.parse("https://www.a1.mk/plati-smetka?portletAction=chooseUserType"),
    ),
    AppIcon(
      Image.asset('assets/images/Search_Logo.bmp'),
      "EVN",
      Uri.parse("https://www.evnonline.mk/payment/fastpay"),
    ),
    AppIcon(
      Image.asset('assets/images/makedonija_osiguruvanje.png'),
      "Makedonija\nosiguruvanje",
      Uri.parse("https://start.insumak.mk/nordsn/f?p=101:PLATI_POLISA"),
    ),
  ];
}
  

