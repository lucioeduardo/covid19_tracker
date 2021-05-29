import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_pp/app/modules/home/home_store.dart';
import 'package:projeto_pp/app/shared/widgets/country_button_widget.dart';
import 'package:projeto_pp/app/shared/widgets/search_field.dart';
import 'package:projeto_pp/app/shared/widgets/title_subtitle_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        var countriesList = store.countriesData.value
            .where((element) =>
                element.country.toLowerCase().startsWith(store.searchString))
            .toList();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: countriesList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: TitleSubtitleWidget(
                                title: 'Covid-19',
                                subtitle: 'Número de casos e mortes',
                              ),
                            ),
                            SearchField(
                              hintText: 'Buscar por país...',
                              store: store,
                            ),
                          ],
                        );
                      }

                      var info = countriesList[index - 1];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CountryButtonWidget(
                            info: info,
                            title: 'Número de casos',
                            buttonOnPressed: () =>  Modular.to.pushNamed('/country', arguments: info)),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
