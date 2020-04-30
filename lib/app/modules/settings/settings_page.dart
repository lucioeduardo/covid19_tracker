import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/settings/widgets/theme_dropdown.dart';
import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/utils/snackbar_util.dart';
import 'package:corona_data/app/shared/utils/theme/constants.dart';
import 'package:corona_data/app/shared/utils/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({Key key, this.title = "Configurações"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState
    extends ModularState<SettingsPage, SettingsController> {
  AppController appController = Modular.get();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SnackBarUtil snackbar;

  ReactionDisposer disposer;

  _SettingsPageState() {
    this.snackbar = SnackBarUtil(_scaffoldKey);
  }
  final countryTextController = TextEditingController();

  List<String> countriesNames;

  @override
  void initState() {
    super.initState();

    disposer = reaction((_) => appController.globalSettingsController.isChanged,
        (value) {
      snackbar.enqueueMessage(
          message: 'Settings has been changed!',
          color: ThemeColors.success,
          id: "SettingsForm");
    });

    countryTextController.text =
        appController.globalSettingsController.country.value.name;
    countriesNames = COUNTRIES.map((country) => country['name']).toList();
  }

  @override
  Widget build(BuildContext context) {
    key = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.robotoSlab(
            fontSize: 24,
            letterSpacing: -1.9,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tema',
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
          ),
          Observer(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SimpleAutoCompleteTextField(
                      style: TextStyle(color: Theme.of(context).accentColor),
                      key: key,
                      decoration: InputDecoration(
                        errorText: null,
                        labelText: "País",
                        labelStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16.0),
                      ),
                      controller: countryTextController,
                      suggestions: countriesNames,
                      textChanged: (text) {
                        controller.cleanError('country_field');
                        // changeCountriesAutoCompleteErrorMessage(null);
                      },
                      clearOnSubmit: false,
                      textSubmitted: (text) {
                        final int idx = countriesNames.indexOf(text);
                        if (countriesNames.indexOf(text) != -1) {
                          print(COUNTRIES[idx]);

                          appController.globalSettingsController
                              .setCountry(CountryModel.fromJson(COUNTRIES[idx]));
                          controller.cleanError('country_field');
                        } else {
                          controller.addError(
                              'country_field', 'Select a valid country');
                        }
                      },
                    ),
                    controller.formErrors.containsKey("country_field")
                        ? CustomDividerError(
                            controller.formErrors['country_field'])
                        : Container()
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }
}


