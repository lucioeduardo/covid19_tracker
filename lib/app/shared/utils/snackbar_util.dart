import 'dart:collection';

import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning, info }

const Map<SnackbarType, Color> SnackBarTypeColor = {
  SnackbarType.success: Colors.green,
  SnackbarType.error: Colors.red,
  SnackbarType.warning: Colors.orange,
  SnackbarType.info: Colors.blue,
};

class SnackBarUtil {
  final GlobalKey<ScaffoldState> context;
  final HashSet<String> _currentIds = HashSet<String>();
  SnackBarUtil(this.context) {
    
  }

  void enqueueMessage(
      {@required String message,
      @required SnackbarType type,
      Duration duration,
      String id}) {
    print(_currentIds);
    if (_currentIds.add(id)) {
      context.currentState
          .showSnackBar(SnackBar(
            duration: duration ?? Duration(seconds: 3),
            content: Text(
              message,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white),
            ),
            backgroundColor: SnackBarTypeColor[type],
          ))
          .closed
          .then((SnackBarClosedReason reason) {
        _currentIds.remove(id);
        print(_currentIds);
      });
    }
  }
}
