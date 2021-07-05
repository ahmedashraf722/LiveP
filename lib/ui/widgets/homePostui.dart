import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_register_auth/covid/pages/home_page.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/model/post.dart';
import 'package:login_register_auth/services/Store.dart';
import 'package:login_register_auth/services/auth.dart';
import 'package:login_register_auth/ui/screens/EditPost.dart';
import 'package:login_register_auth/ui/screens/postDetails.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class homePostUi extends StatefulWidget {
  @override
  _homePostUiState createState() => _homePostUiState();
}

class _homePostUiState extends State<homePostUi> {
  AuthBase authBase = AuthBase();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var tr = ENGLISH;
    return Directionality(
      textDirection: tr == ENGLISH ? TextDirection.ltr : TextDirection.rtl,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://media.slidesgo.com/storage/140626/0-covid-19.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://static.help.unhcr.org/wp-content/uploads/sites/46/2020/04/15125534/IMG_0254.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://sky.shorthandstories.com/coronavirus-outbreak-in-real-time-bypass-service-worker/assets/Kdw000tkCh/virus_earth_web_text-1920x1080.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.akhbarelyom.com/images/images/large/20200626192959623.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //5th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://covid19awareness.sa/wp-content/uploads/2020/04/%D8%A7%D9%84%D8%AA%D8%AC%D9%85%D8%B9%D8%A7%D8%AA_Arabic-300x300.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //6th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://img.youm7.com/ArticleImgs/2021/5/23/211198-image0-(5).jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 190,
              width: size.width,
              height: size.height * .6,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _store.loadPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Post> posts = [];
                      for (var doc in snapshot.data.documents) {
                        var data = doc.data;
                        posts.add(Post(
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
                          return Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 30, right: 30),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        spreadRadius: .25,
                                        blurRadius: 2,
                                        offset: Offset(.5, .5),
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                Positioned(
                                  right: 13,
                                  bottom: 0,
                                  child: Container(
                                    width: 54,
                                    height: 18,
                                    //  decoration: containerDecoration(kActiveBtnColor),
                                    padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, PostDeteils.id,
                                          arguments: posts[index]);
                                    },
                                    child: Container(
                                      width: size.width * .75,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              posts[index].pName ?? '',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
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
