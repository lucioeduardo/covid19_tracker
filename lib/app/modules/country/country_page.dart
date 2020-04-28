import 'package:corona_data/app/modules/country/country_page_stagger_animation.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'country_controller.dart';

class CountryPage extends StatefulWidget {
  final String title;
  const CountryPage({Key key, this.title = "Brasil"}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends ModularState<CountryPage, CountryController>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (controller.countryInfo.error != null) {
          return TryAgainWidget(onPressed: controller.fetchCountryInfo);
        } else {
          InfoModel info = controller.countryInfo.value;

          if (info == null)
            return Center(
              child: Container(
                  width: 150,
                  height: 150,
                  child: VirusCircularAnimation(
                      animation: VirusAnimation.rotation_fast,
                      fit: BoxFit.contain)),
            );

          return CoutryPageStaggerAnimation(
            controller: _controller,
            info: info,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
