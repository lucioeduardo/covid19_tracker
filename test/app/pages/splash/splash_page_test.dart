import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/pages/splash/splash_controller.dart';
import 'package:corona_data/app/pages/splash/splash_page.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_infection_animation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/local_storage_mock.dart';

main() {
  LocalStorageMock localStorageMock = LocalStorageMock();

  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);

  setUp(() {
    Modular.get<SplashController>();
  });

  testWidgets('SplashPage has animation', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SplashPage()));
    final animationFinder = find.byType(VirusInfectionCircularAnimation);
    expect(animationFinder, findsOneWidget);
  });
}
