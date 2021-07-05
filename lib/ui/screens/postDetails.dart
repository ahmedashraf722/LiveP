import 'package:flutter/material.dart';
import 'package:login_register_auth/model/post.dart';
import 'package:login_register_auth/services/Store.dart';
import 'package:login_register_auth/services/auth.dart';
import 'package:login_register_auth/ui/widgets/drawerwidget.dart';
import 'package:login_register_auth/ui/widgets/homePostui.dart';
import 'package:login_register_auth/ui/widgets/postUI.dart';

import 'managePost.dart';
import 'add_post.dart';

class PostDeteils extends StatefulWidget {

  static String id="PostDeteils";

  @override
  _PostDeteilsState createState() => _PostDeteilsState();
}

class _PostDeteilsState extends State<PostDeteils> {
  AuthBase authBase = AuthBase();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    Post posts = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:     Text(
            posts.pName ?? '',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,     letterSpacing: 1.3),
        ),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Icon(Icons.logout),
            onPressed: () async {
              await authBase.logout();
              Navigator.of(context).pushReplacementNamed('IntroScreen');
            },
          ),
        ],
      ),
      drawer: drawerwidget(),
      body: PostUi(),

    );
  }
}
