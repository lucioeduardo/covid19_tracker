import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/pages/splash/splash_controller.dart';
import 'package:corona_data/app/pages/splash/splash_page.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LocalStorageMock extends Mock implements ILocalStorage {}

main() {
  LocalStorageMock localStorageMock = LocalStorageMock();

  initModule(AppModule(),changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);

  when(localStorageMock.isThemeDark())
      .thenAnswer((_) async => Future.value(true));
  when(localStorageMock.getCountry())
      .thenAnswer((_) async => Future.value("Brazil"));

  setUp((){
    Modular.get<SplashController>();
  });
    
  testWidgets('SplashPage has container', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SplashPage()));
    final animationFinder = find.byType(VirusCircularAnimation);
    expect(animationFinder, findsOneWidget);
  });
}
