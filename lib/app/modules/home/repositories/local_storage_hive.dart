import 'dart:async';
import 'dart:io';

import 'package:corona_data/app/modules/home/repositories/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class LocalStorageHive implements ILocalStorage{
  final String _themeKey = 'THEME';
  final String _countryNameKey = 'COUNTRYNAME ';
  
  Completer<Box> _instance = Completer<Box>();
  
  _init() async{
    Directory dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);

    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive(){
    _init();
  }

  @override
  Future<bool> isThemeDark() async{
    var box = await _instance.future;

    var value = await box.get(_themeKey);
    value ??= true;

    return value;
  }

  @override
  Future<void> setTheme(bool value) async {
    var box = await _instance.future;

    await box.put(_themeKey, value);
  }

  @override
  Future<String> getCountry() async{
    var box = await _instance.future;

    var value = await box.get(_countryNameKey);
    value ??= 'Brazil';

    return value;
  }

  @override
  Future<void> setCountry(String value) async {
    var box = await _instance.future;

    await box.put(_countryNameKey, value);
  }
  
}