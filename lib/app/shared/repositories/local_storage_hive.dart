import 'dart:async';
import 'dart:io';

import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/utils/localization/localization_utils.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_storage_interface.dart';


class LocalStorageHive implements ILocalStorage{
  final String _themeKey = 'THEME';
  final String _countryKey = 'COUNTRY';
  final String _localeKey = 'LOCALE';
  
  Completer<Box> _instance = Completer<Box>();
  
  _init() async{
    Directory dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(CountryModelAdapter());

    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive(){
    _init();
  }

  @override
  Future<void> setTheme(String value) async {
    var box = await _instance.future;

    await box.put(_themeKey, value);
  }

  @override
  Future<CountryModel> getCountry() async{
    var box = await _instance.future;

    CountryModel value = await box.get(_countryKey);
    value ??= CountryModel(name:'Brazil', code:"br");

    return value;
  }

  @override
  Future<String> getTheme() async{
    var box = await _instance.future;

    var value = await box.get(_themeKey);
    value ??= 'dark';
    
    return value.toString();
  }

  @override
  Future<void> setCountry(CountryModel value) async {
    var box = await _instance.future;

    await box.put(_countryKey, value);
  }

  @override
  Future<String> getLocale() async{
    var box = await _instance.future;

    var value = await box.get(_localeKey);
    
    value ??= Configuration.defaultLocaleKey;
    
    return value;
  }

  @override
  Future<void> setLocale(String value) async {
    var box = await _instance.future;

    await box.put(_localeKey, value);
  }
  
}