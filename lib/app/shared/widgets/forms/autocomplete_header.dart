import 'dart:async';

import 'package:corona_data/app/shared/widgets/forms/i18n.dart/autocomplete_header.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AutocompleteHeader<T> extends StatelessWidget {
  const AutocompleteHeader({
    Key key,
    @required this.suggestionsBoxController,
    @required this.typeAheadController,
    @required this.kBorderRadius,
    @required this.focusNode,
    @required this.suggestionsCallback,
    @required this.itemBuilder,
    @required this.onSuggestionSelected,
    @required this.primaryColor,
    @required this.accentColor,
  }) : super(key: key);

  final SuggestionsBoxController suggestionsBoxController;
  final TextEditingController typeAheadController;
  final FocusNode focusNode;
  final Color primaryColor;
  final Color accentColor;
  final double kBorderRadius;
  final FutureOr<Iterable<T>> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        margin: EdgeInsets.only(top: 8, left: 10, right: 10),
        decoration: containerDecoration(),
        child: TypeAheadField<T>(
          hideSuggestionsOnKeyboardHide: true,
          hideOnEmpty: true,
          hideOnError: true,
          hideOnLoading: false,
          getImmediateSuggestions: false,
          suggestionsBoxController: suggestionsBoxController,
          debounceDuration: Duration(milliseconds: 500),
          animationDuration: Duration(milliseconds: 800),
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: false,
            textInputAction: TextInputAction.search,
            controller: typeAheadController,
            keyboardType: TextInputType.text,
            focusNode: focusNode,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: this.accentColor,
            ),
            decoration: inputDecoration(),
          ),
          suggestionsCallback: suggestionsCallback,
          itemBuilder: itemBuilder,
          onSuggestionSelected: onSuggestionSelected,
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius)),
          noItemsFoundBuilder: noItemsFoundBuilder,
          loadingBuilder: (context) {
            return Text("Loading..".i18n);
          },
          errorBuilder: (_, __) {
            return Text("blank".i18n);
          },
        ));
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(kBorderRadius),
      color: this.primaryColor.withOpacity(0.8),
      boxShadow: [
        BoxShadow(
            blurRadius: 4,
            color: this.accentColor.withOpacity(0.2),
            offset: Offset.fromDirection(1, 2),
            spreadRadius: 4)
      ],
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        // prefixStyle: TextStyle(fontSize: 16),
        prefix: IconButton(
          // padding: EdgeInsets.only(right: 30),
          alignment: Alignment.centerLeft,
          icon: FaIcon(
            FontAwesomeIcons.search,
            size: 16,
            color: this.accentColor,
          ),
          onPressed: null,
        ),
        suffix: IconButton(
            iconSize: 16,
            alignment: Alignment.centerRight,
            onPressed: () {
              typeAheadController.clear();
            },
            icon: FaIcon(
              FontAwesomeIcons.times,
              color: this.accentColor,
            )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
          gapPadding: 0.0,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            borderSide: BorderSide(width: 2.0)),
        labelText: "Tap for search.".i18n,
        labelStyle: TextStyle(
          backgroundColor: Colors.transparent,
          fontWeight: FontWeight.w900,
          color: this.accentColor,
        ));
  }

  Widget noItemsFoundBuilder(context) {
    if (typeAheadController.text.isEmpty || typeAheadController.text == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        typeAheadController.text.isNotEmpty
            ? "No itens found.".i18n
            : "Type for search.".i18n,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}
