import 'package:flutter/material.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/ui/widgets/auth_form.dart';

enum AuthType { login, register }

class AuthScreen extends StatelessWidget {
  final AuthType authType;
  static String id="AuthScreen";
  const AuthScreen({Key key, this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 65),
                        Text(
                         getTranslated(context,"LivePandemic"),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,     letterSpacing: 1.9),
                        ),
                        Hero(
                          tag: 'logoAnimation',
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 250,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AuthForm(authType: authType),
            ],
          ),
        ),
      ),
    );
  }
}
