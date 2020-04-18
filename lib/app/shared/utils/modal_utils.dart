import 'package:corona_data/app/modules/home/widgets/graphs/world_cases/world_cases.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalUtils {
  static void showModal(BuildContext context, Widget graphWidget) {
    showMaterialModalBottomSheet(
      expand: false,
      isDismissible: true,
      context: context,
      backgroundColor: Theme.of(context).primaryColorDark,
      barrierColor: Theme.of(context).accentColor.withAlpha(60),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context, scrollController) => Container(
        //color: Colors.white,
        child: Container(
          height: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                graphWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
