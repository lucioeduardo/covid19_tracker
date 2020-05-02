import 'package:flutter/material.dart';

abstract class ILocalization{
  final String name = null;
  final String languageCode = null;
  final String countryCode = null;

  Locale getLocale(){
    return Locale(languageCode,countryCode);
  }
}