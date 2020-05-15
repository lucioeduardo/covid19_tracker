import 'package:diacritic/diacritic.dart';

extension RemoveDiacritcs on String{
  String normalizeDiacritics() =>
    removeDiacritics(this);
}