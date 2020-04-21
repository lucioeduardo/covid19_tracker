import 'dart:collection';

import 'package:flutter/material.dart';

class SnackBarUtil {
  final GlobalKey<ScaffoldState> context;
  final HashSet<String> _currentIds = HashSet<String>();
  
  SnackBarUtil(this.context) {
    
  }

  void enqueueMessage(
      {@required String message,
      @required Color color,
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
            backgroundColor: color,
          ))
          .closed
          .then((SnackBarClosedReason reason) {
        _currentIds.remove(id);
        print(_currentIds);
      });
    }
  }
}
