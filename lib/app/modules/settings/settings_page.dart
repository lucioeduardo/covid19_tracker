import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key key, this.title = "Configurações"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState
    extends ModularState<SettingsPage, SettingsController> {
  //use 'controller' variable to access controller

  AppController appController = Modular.get();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  final countryTextController = TextEditingController();

  List<String> countriesNames;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryTextController.text = appController.countryName;
    countriesNames = COUNTRIES.map((country) => country['name']).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // actions: <Widget>[
        //   IconButton(icon: Icon(FontAwesomeIcons.adjust), onPressed: () => Modular.to.pushNamed("/settings"))
        // ],
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
                  'Tema Escuro',
                  style: GoogleFonts.robotoSlab(
                      color: Theme.of(context).accentColor, fontSize: 16),
                ),
                Observer(builder: (_) {
                  return Switch(
                      value: appController.themeDark,
                      onChanged: appController.setTheme);
                }),
              ],
            ),
          ),
          Observer(builder: (_) {
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
                        if (countriesNames.indexOf(text) != -1) {
                          appController.setCountry(text);
                          controller.cleanError('country_field');
                        } else {
                          print("Error");
                          controller.addError(
                              'country_field', 'Select a valid country');
                          // changeCountriesAutoCompleteErrorMessage("teste");
                        }

                        return null;
                      },
                    ),
                    controller.formErrors.containsKey("country_field")
                        ? CustomDividerError(controller.formErrors['country_field'])
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

  // void changeCountriesAutoCompleteErrorMessage(String message) {
  //   if (key.currentState == null) return;
  //   key.currentState.updateDecoration(
  //       InputDecoration(
  //         errorText: message,
  //         labelText: "País",
  //         labelStyle:
  //             TextStyle(color: Theme.of(context).accentColor, fontSize: 16.0),
  //       ),
  //       null,
  //       null,
  //       null,
  //       null,
  //       null);

  // }

  
}

class CustomDividerError extends StatelessWidget {
  final String message;

  CustomDividerError(this.message);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.redAccent,
        ),
        Text(
          message,
          style: TextStyle(color: Colors.redAccent),
        )
      ],
    );
  }
}
