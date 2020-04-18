import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalUtils {
  static void showModal(BuildContext context, Widget graphWidget) {
    showMaterialModalBottomSheet(
      expand: false,
      isDismissible: true,
      enableDrag: false,
      context: context,
      backgroundColor: Theme.of(context).primaryColorDark,
      barrierColor: Theme.of(context).accentColor.withAlpha(60),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context, scrollController) => Container(
        child: Container(
          height: 500,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                color: Theme.of(context).primaryColorLight,
                icon: Icon(Icons.close,),
                onPressed: Navigator.of(context).pop,
              ),
              Container(height: 30,),
              graphWidget,
            ],
          ),
        ),
      ),
    );
  }
}
