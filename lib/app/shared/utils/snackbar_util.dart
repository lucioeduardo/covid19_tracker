import 'package:flutter/material.dart';

enum SnackbarType{
  success,
  error,
  warning,
  info
}

const Map<SnackbarType,Color> SnackBarTypeColor = {
  SnackbarType.success:Colors.green,
  SnackbarType.error:Colors.red,
  SnackbarType.warning:Colors.orange,
  SnackbarType.info:Colors.blue,
};

class SnackBarUtil{
  final GlobalKey<ScaffoldState> context;
  SnackBarUtil(this.context){
    print("snackutil");
  }

  void enqueueMessage(String message, SnackbarType type){
    
    context.currentState.showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white),
        ),
        backgroundColor: SnackBarTypeColor[type],
        ));
  
  }
}