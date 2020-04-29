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
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context, scrollController) => graphWidget
    );
  }
}
