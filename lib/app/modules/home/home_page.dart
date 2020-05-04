import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'translations/home_page.i18n.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final AppController appController = Modular.get();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    

    return Observer(
      builder: (BuildContext context) {
        
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(
                  controller.title.i18n,
              style: GoogleFonts.robotoSlab(
                fontSize: 24,
                letterSpacing: -1.9,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(FontAwesomeIcons.cog),
                  onPressed: () => Modular.to.pushNamed("/settings"))
            ],
            centerTitle: true,
          ),
          body: controller.page,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).backgroundColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.flagCheckered),
                title: Text(appController.globalSettingsController.country.name.i18n),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.globe),
                title: Text('World'.i18n),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.mapMarked),
                title: Text('Map'.i18n),
              ),
            ],
            currentIndex: controller.selectedIndex,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Theme.of(context).primaryColorLight,
            onTap: controller.setPage,
          ),
        );
      },
    );
  }
}
