import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/settings/widgets/theme/theme_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeRow extends StatelessWidget {
  final String title;
  const ThemeRow({
    Key key,
    @required this.appController, @required this.title,
  }) : super(key: key);

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.title,
            style: GoogleFonts.robotoSlab(
                color: Theme.of(context).accentColor, fontSize: 16),
          ),
          Observer(builder: (_) {
          
            return ThemeDropdown(
              value: appController
                  .globalSettingsController.themeName.value
                  .toUpperCase(),
              onChanged: (String newValue) {
                appController.globalSettingsController.setTheme(newValue);
              },
            );
          }),
        ],
      ),
    );
  }
}