import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:mockito/mockito.dart';

class LocalStorageMock extends Mock implements ILocalStorage {
  LocalStorageMock() {
    when(this.isThemeDark()).thenAnswer(
      (_) async => Future<bool>.value(true),
    );
    when(this.getCountry()).thenAnswer(
      (_) async => Future.value("Brazil"),
    );
  }
}
