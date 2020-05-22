import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
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
      (_) async => Future.value(Configuration.defaultLocaleKey),
    );
    when(this.getLatestSearchs()).thenAnswer(
      (_) async => Future.value(["AL","PE"]),
    );
  }
}
