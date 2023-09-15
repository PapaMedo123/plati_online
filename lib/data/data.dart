import 'package:flutter/material.dart';
import 'package:plati_online/data/icon.dart';

class AppData {

  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  List<AppIcon> list = [
    AppIcon(Image.asset('assets/images/T-Mobile_logo_2022.svg.png'), "Tmobile", Uri.parse("https://www.telekom.mk/plationline/")),
    AppIcon(Image.asset('assets/images/a1_logo.jpg'), "A1", Uri.parse("https://www.a1.mk/plati-smetka?portletAction=chooseUserType")),
    AppIcon(Image.asset('assets/images/Search_Logo.bmp'), "EVN", Uri.parse("https://www.evnonline.mk/payment/fastpay")),
    AppIcon(Image.asset('assets/images/makedonija_osiguruvanje.png'), "Makedonija\nosiguruvanje", Uri.parse("https://start.insumak.mk/nordsn/f?p=101:PLATI_POLISA")),
  ];
}