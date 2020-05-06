import 'package:flutter/material.dart';

class ExtraPallete {
  final Color success;
  final Color info;
  final Color warning;
  final Color error;

  ExtraPallete({this.success, this.info, this.warning, this.error});

  bool operator == (Object other) {
    if (other.runtimeType != runtimeType) return false;
    final ExtraPallete otherData = other;
    
    return this.success == otherData.success &&
        this.info == otherData.info &&
        this.warning == otherData.warning &&
        this.error == otherData.error;
  }
}
