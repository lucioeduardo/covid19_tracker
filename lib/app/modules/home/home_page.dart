import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_pp/app/modules/home/home_store.dart';
import 'package:projeto_pp/app/shared/widgets/country_button_widget.dart';
import 'package:projeto_pp/app/shared/widgets/search_field.dart';
import 'package:projeto_pp/app/shared/widgets/title_subtitle_widget.dart';

import '../../shared/extensions/text_size_extension.dart';

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
        print(MediaQuery.of(context).size.width);

        var list = store.countriesData.value;
        if(list == null) list = [];
        var countriesList = list
            .where((element) =>
                element.country.toLowerCase().startsWith(store.searchString))
            .toList();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: countriesList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 15.0.h),
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
                        padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.w),
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
