import 'package:flutter/material.dart';

class ExtraPallete {
  final Color success;
  final Color info;
  final Color warning;
  final Color error;
  final Color light;
  final Color dark;

  ExtraPallete({this.light, this.dark, this.success, this.info, this.warning, this.error});

  bool operator == (Object other) {
    if (other.runtimeType != runtimeType) return false;
    final ExtraPallete otherData = other;
    
    return this.success == otherData.success &&
        this.info == otherData.info &&
        this.warning == otherData.warning &&
        this.error == otherData.error;
  }

  Color operator[](String name){
    switch(name){
      case('success'):
        return this.success;
      case('info'):
        return this.info;
      case('warning'):
        return this.warning;
      case('error'):
        return this.error;
      case('light'):
        return this.light;
      case ('dark'):
        return this.dark;
    }

    throw Exception('The color named $name doesnt exist in the palette.');
  }
}
