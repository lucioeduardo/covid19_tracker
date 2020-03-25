import 'package:corona_data/app/modules/home/pages/brazil/brazil_page.dart';
import 'package:corona_data/app/modules/home/pages/states_map/states_map_page.dart';
import 'package:corona_data/app/modules/home/pages/world/world_page.dart';
import 'package:corona_data/app/shared/brazil_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  String title;
  HomePage({Key key, this.title = "Brasil"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  
  final titleName = ["Brasil","Mundo", "Mapa"];

  List<Widget> pages = [
    BrazilPage(),
    WorldPage(),
    StatesMapPage(),
  ];


  void setPage(index){
    setState(() {
      _selectedIndex = index;
      widget.title = titleName[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.robotoSlab(
            fontSize: 24,
            letterSpacing: -1.9,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(BrazilIcon.emojione_monotone_flag_for_flag_brazil),
            title: Text('Brasil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.globe),
            title: Text('Mundo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mapMarked),
            title: Text('Mapa'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        onTap: setPage,
      ),
    );
  }
}
