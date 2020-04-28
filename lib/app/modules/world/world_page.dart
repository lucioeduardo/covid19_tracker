import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/world_cases/world_cases_widget.dart';
import 'package:corona_data/app/modules/world/coutry_page_stagger_animation.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:corona_data/app/shared/widgets/roudend_icon_button.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'world_controller.dart';

class WorldPage extends StatefulWidget {
  final String title;
  const WorldPage({Key key, this.title = "World"}) : super(key: key);

  @override
  _WorldPageState createState() => _WorldPageState();
}

class _WorldPageState extends ModularState<WorldPage, WorldController> with SingleTickerProviderStateMixin{
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
    return Observer(builder: (context) {
      if (controller.worldInfo.error != null) {
        return TryAgainWidget(onPressed: controller.fetchWorldInfo);
      } else {
        InfoModel info = controller.worldInfo.value;
        if (info == null)
          return Center(
              child: Container(
            width: 150,
            height: 150,
            child: VirusCircularAnimation(
                animation: VirusAnimation.rotation_fast, fit: BoxFit.contain),
          ));

        return WorldPageStaggerAnimation(controller: _controller,info: info,);
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

