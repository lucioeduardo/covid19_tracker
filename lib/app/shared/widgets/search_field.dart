import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto_pp/app/modules/home/home_store.dart';
import 'package:projeto_pp/app/shared/util/theme/color_palette.dart';

class SearchField<T> extends StatelessWidget {

  const SearchField({
    Key key,
    @required this.hintText, @required this.store,
  }) : super(key: key);

  final String hintText;
  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: (value) => store.changeSearchString(value),
        autofocus: false,
        style: TextStyle(
            fontSize: 14,
            color: ColorPalette.grey,
            decoration: TextDecoration.none),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: ColorPalette.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              FontAwesomeIcons.search,
              color: ColorPalette.grey,
              size: 25,
            ),
          ),
          filled: true,
          fillColor: ColorPalette.lightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
