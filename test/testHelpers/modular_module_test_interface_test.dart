import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../app/mocks/local_storage_mock.dart';
import '../helpers/app_module_init_helper.dart';
import '../helpers/home_module_init_helper.dart';
import '../helpers/modular_test_interface.dart';


class CustomModuleTestMock extends Mock implements IModularTest {}
class CustomLocalStorage extends Mock implements ILocalStorage {}

main() {
  group("change bind", () {
    AppModule app = AppModule();
    InitAppModuleHelper().load();

    test('ILocalStorage is a LocalMock', () {
      expect(Modular.get<ILocalStorage>(), isA<LocalStorageMock>());
    });

    setUp(() {
      InitAppModuleHelper().load();
    });

    tearDown(() {
      Modular.removeModule(app);
    });
  });
  group("IModuleTest", () {
    setUp(() {
      InitAppModuleHelper().load();
    });

    AppController appControllerBeforeReload = Modular.get<AppController>();
    

    test('ILocalStorage is not equal when reload by default', () {
      AppController appControllerAfterReload = Modular.get<AppController>();
      print(appControllerAfterReload.hashCode);
      expect(appControllerBeforeReload.hashCode,
          isNot(equals(appControllerAfterReload.hashCode)));
    });
    test('ILocalStorage is equals when keepModulesOnMemory', () {
      appControllerBeforeReload = Modular.get<AppController>();
      InitAppModuleHelper(modularTestType: ModularTestType.keepModulesOnMemory)
          .load();
      AppController appControllerAfterReload = Modular.get<AppController>();
      expect(appControllerBeforeReload.hashCode,
          equals(appControllerAfterReload.hashCode));
    });
    test('ILocalStorage Change bind on load on runtime', () {
      IModularTest modularTest = InitAppModuleHelper();
      modularTest.load();

      ILocalStorage localStorageBeforeChangeBind = Modular.get<ILocalStorage>();
      expect(localStorageBeforeChangeBind.runtimeType, equals(LocalStorageMock));

      modularTest.load(changeBinds: [
        Bind<ILocalStorage>((i) => CustomLocalStorage()),
      ]);
      ILocalStorage localStorageAfterChangeBind = Modular.get<ILocalStorage>();

      expect(localStorageAfterChangeBind.runtimeType,
          equals(CustomLocalStorage));
    });
    test('ILocalStorage getNewOrDefaultDendencies', () {
      IModularTest modularTest = InitAppModuleHelper();

      expect(modularTest.getNewOrDefaultDendencies(null, true), isNull);
      expect(
          modularTest.getNewOrDefaultDendencies(InitAppModuleHelper(), true),
          isNotNull);
    });
    test('ILocalStorage getNewOrDefaultBinds', () {
      IModularTest modularTest = InitAppModuleHelper();

      expect(modularTest.getNewOrDefaultBinds([]), isEmpty);
      expect(modularTest.getNewOrDefaultBinds(null), isNotEmpty);
      expect(modularTest.getNewOrDefaultBinds(null).first,
          isInstanceOf<Bind<ILocalStorage>>());
    });
    test('ILocalStorage memoryManage', () {
      IModularTest modularTest = InitAppModuleHelper();

      modularTest.load();
      expect(Modular.get<ILocalStorage>(), isNotNull);

      modularTest.memoryManage(ModularTestType.keepModulesOnMemory);
      expect(Modular.get<ILocalStorage>(), isNotNull);

      modularTest.memoryManage(ModularTestType.resetModule);

      expect(
        () => Modular.get<ILocalStorage>(),
        throwsA(
          isInstanceOf<ModularError>(),
        ),
      );
    });
    test('ILocalStorage loadModularDependencies', () {
      IModularTest modularTest = InitAppModuleHelper();

      final customModule = CustomModuleTestMock();
      when(customModule.load()).thenReturn(() {});

      modularTest.loadModularDependency(true, customModule);
      verify(customModule.load()).called(1);

      modularTest.loadModularDependency(false, customModule);
      verifyNever(customModule.load());
    });
    test('ILocalStorage load HomeModule', () {
      IModularTest homeModuleTest = InitHomeModuleHelper();
      expect(
        () => Modular.get<LocalStorageMock>(),
        throwsA(
          isInstanceOf<ModularError>(),
        ),
      );

      homeModuleTest.load();
      expect(
        Modular.get<ICovidRepository>(),
        isNotNull,
      );
    });

    
  });
  
}
