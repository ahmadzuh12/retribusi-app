import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retribusi_app/common/const/color.dart';
import 'package:retribusi_app/common/const/dictionary.dart';
import 'package:retribusi_app/common/environment/environment.dart';
import 'package:retribusi_app/ui/pages/history_page.dart';
import 'package:retribusi_app/ui/pages/setoran_page.dart';
import 'package:retribusi_app/ui/pages/tagihan_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final _widgetOptions = [
    Tagihan(),
    Setoran(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorBase.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset('${Environment.imageAssets}app.png',
                    width: 40.0, height: 40.0),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(Dictionary.appName,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(Dictionary.subTitle,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                      ],
                    )),
              ],
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () => print('object'),
                child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          //If you want to show body behind the navbar, it should be true
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorBase.blue,
            currentIndex: currentIndex,
            unselectedItemColor: Colors.grey,
            onTap: (val) {
              currentIndex = val;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: new Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.get_app), title: new Text('Setoran')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), title: new Text('History')),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.exit_to_app), title: new Text('Keluar')),
            ],
          ),
          body: _widgetOptions.elementAt(currentIndex)),
    );
  }
}
