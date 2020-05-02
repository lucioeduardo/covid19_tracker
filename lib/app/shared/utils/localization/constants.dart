

import 'package:corona_data/app/shared/utils/localization/locales/en_us_locale.dart';
import 'package:corona_data/app/shared/utils/localization/locales/pt_br_locale.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';

const kPTBR = "pt_br";
const kENUS = "en_us";

final Map<String, ILocalization> kLocales = {
    kPTBR: PTBRLocale(),
    kENUS: ENUSLocale(),
  };
