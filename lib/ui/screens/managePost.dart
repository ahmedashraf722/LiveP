import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/model/post.dart';
import 'package:login_register_auth/services/Store.dart';
import 'package:login_register_auth/ui/screens/EditPost.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_menu.dart';
import '../../constants.dart';

class ManagePost extends StatefulWidget {
  static String id = "ManagePost";

  @override
  _managePostState createState() => _managePostState();
}

class _managePostState extends State<ManagePost> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var tr = ENGLISH;
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "diseaseManagement")),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: tr == ENGLISH ? TextDirection.ltr : TextDirection.rtl,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              width: size.width,
              height: size.height * .85,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _store.loadPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Post> posts = [];
                      for (var doc in snapshot.data.documents) {
                        var data = doc.data;

                        posts.add(Post(
                          pId: doc.documentID,
                          pName: data[kPostName],
                          pSymptoms: data[kPostpSymptoms],
                          pAddrees: data[kPostLocation],
                          pNumberWorker: data[kPostNumberWorker],
                          plinkVid: data[kPostlinkVid],
                          Page: data[kPostAge],
                          Pnumberdie: data[kPostnumberdie],
                          preason: data[kpostpreason],
                          pnumberWorkerafter: data[kPostNumberWorkerAfter],
                          Ptreatment: data[kPostType],
                          pDate: data[kPostDate],
                        ));
                      }
                      return ListView.builder(
                        itemCount: posts.length,
                        //  controller: _scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              //
                              onTapUp: (details) async {
                                double dx = details.globalPosition.dx;
                                double dy = details.globalPosition.dy;
                                double dx2 =
                                    MediaQuery.of(context).size.width - dx;
                                double dy2 =
                                    MediaQuery.of(context).size.width - dy;
                                await showMenu(
                                    context: context,
                                    position:
                                        RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                                    items: [
                                      MyPopupMenuItem(
                                        onClick: () {
                                          Navigator.pushNamed(
                                              context, EditPost.id,
                                              arguments: posts[index]);
                                        },
                                        child: Text(
                                            getTranslated(context, "Edit")),
                                      ),
                                      MyPopupMenuItem(
                                        onClick: () {
                                          _store.deletePost(posts[index].pId);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                            getTranslated(context, "Delete")),
                                      ),
                                    ]);
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 8, 15),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.2),
                                            spreadRadius: .50,
                                            blurRadius: 4,
                                            offset: Offset(.5, .5),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 13,
                                      bottom: 0,
                                      child: Container(
                                        width: 54,
                                        height: 18,
                                        //  decoration: containerDecoration(kActiveBtnColor),
                                        padding:
                                            EdgeInsets.fromLTRB(6, 0, 6, 0),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        width: size.width * .75,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Directionality(
                                                          textDirection: tr ==
                                                                  ENGLISH
                                                              ? TextDirection
                                                                  .ltr
                                                              : TextDirection
                                                                  .rtl,
                                                          child: AlertDialog(
                                                              title:
                                                                  Directionality(
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                child: new Text(
                                                                  getTranslated(
                                                                      context,
                                                                      "Do you want to delete this disease"),
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                              actions: <Widget>[
                                                                // usually buttons at the bottom of the dialog
                                                                Row(
                                                                  children: [
                                                                    new FlatButton(
                                                                      child: new Text(getTranslated(
                                                                          context,
                                                                          "Yes")),
                                                                      onPressed:
                                                                          () {
                                                                        _store.deletePost(
                                                                            posts[index].pId);
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                    new FlatButton(
                                                                      child: new Text(getTranslated(
                                                                          context,
                                                                          "No")),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ]),
                                                        );
                                                      },
                                                    );
                                                  }),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.green,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, EditPost.id,
                                                        arguments:
                                                            posts[index]);
                                                  }),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  posts[index].pName ?? '',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    } else
                      return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
