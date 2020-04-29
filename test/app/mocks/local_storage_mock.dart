import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:mockito/mockito.dart';

class LocalStorageMock extends Mock implements ILocalStorage {
  LocalStorageMock() {
    when(this.getTheme()).thenAnswer(
      (_) async => Future<String>.value('dark'),
    );
    when(this.getCountry()).thenAnswer(
      (_) async => Future.value("Brazil"),
    );
  }
}
