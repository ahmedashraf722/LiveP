import 'package:flutter/material.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/localization/models.dart';
import 'package:login_register_auth/main.dart';
import 'package:login_register_auth/services/Store.dart';
import 'package:login_register_auth/services/auth.dart';
import 'package:login_register_auth/ui/widgets/drawerwidget.dart';
import 'package:login_register_auth/ui/widgets/homePostui.dart';
//import 'package:login_register_auth/ui/widgets/postUI.dart';

//import 'managePost.dart';
import 'add_post.dart';

class HomeScreenAdmain extends StatefulWidget {
  static String id = "HomeScreenAdmain";

  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmain> {
  void _changeLanguage(Language lang) async {
    Locale _temp = await setLocale(lang.languageCode);
    MyApp.setLocale(context, _temp);
  }

  AuthBase authBase = AuthBase();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, "LivePandemic"),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 1.8,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              lang.flag,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(lang.name)
                          ],
                        )))
                    .toList(),
                onChanged: (Language lang) {
                  _changeLanguage(lang);
                },
              ),
            ),
          ),
          /*FlatButton(
            child: Icon(Icons.logout),
            onPressed: () async {
              await authBase.logout();
              Navigator.of(context).pushReplacementNamed('IntroScreen');
            },
          ),*/
        ],
      ),
      drawer: drawerwidget(),
      body: homePostUi(),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            autofocus: true,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPost(),
                ),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
