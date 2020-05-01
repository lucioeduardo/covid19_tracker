import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:corona_data/app/shared/utils/localization/localization_utils.dart';
import 'package:mockito/mockito.dart';

class LocalStorageMock extends Mock implements ILocalStorage {
  LocalStorageMock() {
    when(this.getTheme()).thenAnswer(
      (_) async => Future<String>.value('dark'),
    );
    when(this.getCountry()).thenAnswer(
      (_) async => Future.value( CountryModel(name: "Brazil", code: "br")),
    );
    when(this.getLocale()).thenAnswer(
      (_) async => Future.value( LocalizationUtils.defaultLocaleKey),
    );
  }
}
