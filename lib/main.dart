import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/localization/set_localization.dart';
import 'package:login_register_auth/ui/screens/EditPost.dart';
import 'package:login_register_auth/ui/screens/managePost.dart';
import 'package:login_register_auth/ui/screens/add_post.dart';
import 'package:login_register_auth/ui/screens/auth_screen.dart';
import 'package:login_register_auth/ui/screens/home_screenAdmin.dart';
import 'package:login_register_auth/ui/screens/intro_screen.dart';
import 'package:login_register_auth/ui/screens/postDetails.dart';

//import 'package:login_register_auth/ui/screens/homeScreenUser.dart';
//import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        color: Colors.grey,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MaterialApp(
        locale: _locale,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localizationsDelegates: [
          SetLocalization.localizationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocal, supportedLocales) {
          for (var local in supportedLocales) {
            if (local.languageCode == deviceLocal.languageCode &&
                local.countryCode == deviceLocal.countryCode) {
              return deviceLocal;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Live',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xffd8ecfa),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]),
              borderRadius: BorderRadius.circular(25),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        initialRoute: isUserLoggedIn ? HomeScreenAdmain.id : IntroScreen.id,
        routes: {
          'home': (context) => HomeScreenAdmain(),
          'login': (context) => AuthScreen(authType: AuthType.login),
          'register': (context) => AuthScreen(authType: AuthType.register),
          AuthScreen.id: (context) => AuthScreen(),
          AddPost.id: (context) => AddPost(),
          ManagePost.id: (context) => ManagePost(),
          EditPost.id: (context) => EditPost(),
          // HomeScreenUser.id: (context) => HomeScreenUser(),
          IntroScreen.id: (context) => IntroScreen(),
          HomeScreenAdmain.id: (context) => HomeScreenAdmain(),
          PostDeteils.id: (context) => PostDeteils(),
        },
      );
    }
  }
}
