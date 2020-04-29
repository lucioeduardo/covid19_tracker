import 'package:corona_data/app/modules/world/world_page_stagger_animation.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'world_controller.dart';

class WorldPage extends StatefulWidget {
  final String title;
  final AnimationController controller;
  const WorldPage({Key key, this.title = "World", this.controller}) : super(key: key);

  @override
  _WorldPageState createState() => _WorldPageState();
}

class _WorldPageState extends ModularState<WorldPage, WorldController>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? AnimationController(
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
              child: VirusCircularAnimation(
                  animation: VirusAnimation.rotation_fast, fit: BoxFit.contain, size: AnimationSizes.large));

        return WorldPageStaggerAnimation(
          controller: _controller,
          info: info,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
