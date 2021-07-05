import 'package:flutter/material.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/services/auth.dart';
import 'package:login_register_auth/ui/screens/add_post.dart';
import 'package:login_register_auth/ui/screens/home_screenAdmin.dart';
import 'package:login_register_auth/ui/screens/managePost.dart';
import 'package:url_launcher/url_launcher.dart';

AuthBase authBase = AuthBase();

class drawerwidget extends StatefulWidget {
  const drawerwidget({Key key}) : super(key: key);

  @override
  _drawerwidgetState createState() => _drawerwidgetState();
}

class _drawerwidgetState extends State<drawerwidget> {
  @override
  Widget build(BuildContext context) {
    var tr = ENGLISH;
    return Directionality(
      textDirection: tr == ENGLISH ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                  child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    child: Image.asset(
                      "assets/images/coronavirus2.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Text(
                    getTranslated(context, "LivePandemic"),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.9),
                  ),
                ],
              )),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 40,
                  ),
                  Text(getTranslated(context, "Homepage")),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreenAdmain(),
                  ),
                ); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 40,
                  ),
                  Text(getTranslated(context, "addDisease")),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(),
                  ),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(
                    width: 40,
                  ),
                  Text(getTranslated(context, "diseaseManagement")),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManagePost()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 40,
                  ),
                  Text(getTranslated(context, "Settings")),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Directionality(
                      textDirection: tr == ENGLISH ? TextDirection.ltr :TextDirection.rtl,
                      child: AlertDialog(
                          title: Directionality(
                            textDirection: tr == ENGLISH ? TextDirection.ltr :TextDirection.rtl,
                            child: new Text(
                              getTranslated(context, "Settings"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          content: Container(
                            height: 100,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Directionality(
                                          textDirection: tr == ENGLISH ? TextDirection.ltr :TextDirection.rtl,
                                          child: AlertDialog(
                                              title: Directionality(
                                                textDirection:
                                                tr == ENGLISH ? TextDirection.ltr : TextDirection.rtl,
                                                child: new Text(
                                                  getTranslated(
                                                      context, "AboutTheApp"),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              content: new Text(
                                                getTranslated(context,
                                                    "It is a scientific application that explains the life of every disease that has spread and affected in the world, as the application shows us important information about each disease, such as the places of spread of the disease, the percentage of infections with this disease, the death rate and recovery from this disease, methods of treatment, tips to avoid disease, the ages that are likely to be infected, and many data about diseases different"),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              actions: <Widget>[
                                                // usually buttons at the bottom of the dialog
                                                new FlatButton(
                                                  child: new Text(getTranslated(
                                                      context, "close")),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ]),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                      getTranslated(context, "AboutTheApp")),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Directionality(
                                          textDirection: tr == ENGLISH ? TextDirection.ltr :TextDirection.rtl,
                                          child: AlertDialog(
                                              title:Directionality(
                                                textDirection:
                                                tr == ENGLISH ? TextDirection.ltr :TextDirection.rtl,
                                                child: new Text(
                                                  getTranslated(
                                                      context, "PrivacyPolicy"),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              content: new Text(
                                                getTranslated(context,
                                                    "The Terms of Service, or any part thereof, may be modified, or added or removed at any time, and such modifications, additions or deletions will appear on the site immediately upon their publication, and the user is responsible for checking the site periodically for any modifications that may be made to the terms of use . Your use of the Site after posting such modifications or additions shall be deemed your acceptance of such modifications, additions or deletions. If you do not agree to the revised Terms of Use, you may not access or use the Website, and you must stop using this Website immediately."),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              actions: <Widget>[
                                                // usually buttons at the bottom of the dialog
                                                new FlatButton(
                                                  child: new Text(getTranslated(
                                                      context, "close")),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ]),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    getTranslated(context, "PrivacyPolicy"),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launch(
                                        "https://csifac.mans.edu.eg/contacts-ar");
                                  },
                                  child: Text(
                                    getTranslated(context, "ConnectWithUs"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text(getTranslated(context, "close")),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ]),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 40,
                  ),
                  Text(getTranslated(context, "signOut")),
                ],
              ),
              onTap: () async {
                await authBase.logout();
                Navigator.of(context).pushReplacementNamed('IntroScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
