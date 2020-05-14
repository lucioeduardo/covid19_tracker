import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CitiesAutoCompleteField extends StatefulWidget {
  final StatesMapController statesMapController;

  const CitiesAutoCompleteField({Key key, this.statesMapController}) : super(key: key);
  @override
  _CitiesAutoCompleteFieldState createState() =>
      _CitiesAutoCompleteFieldState();
}

class _CitiesAutoCompleteFieldState extends State<CitiesAutoCompleteField> {
  

  _CitiesAutoCompleteFieldState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: false,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              backgroundColor: Theme.of(context).accentColor,
              decorationColor: Theme.of(context).accentColor,
              color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Busque por alguma cidade.",
            labelStyle: TextStyle(backgroundColor: Colors.transparent)
          ),
        ),
        suggestionsCallback: (pattern) async {
          print(pattern);
          
          return await widget.statesMapController.findMarker(pattern);
        },
        itemBuilder: (context, markerModel) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(markerModel.title),
            // subtitle: Text('\$${suggestion['price']}'),
          );
        },
        onSuggestionSelected: (suggestion) {
          print("selecionado");
        },
      ),
    );
  }
}
