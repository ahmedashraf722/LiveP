import 'package:flutter/material.dart';
import 'package:login_register_auth/constants.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/model/post.dart';
import 'package:login_register_auth/services/Store.dart';
import 'package:login_register_auth/ui/widgets/customTextFeild.dart';
import 'package:login_register_auth/ui/widgets/original_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_screenAdmin.dart';

class EditPost extends StatelessWidget {
  static String id = "EditPost";
  String _name,
      _location,
      _treatment,
      _date,
      _linkVid,
      _numberdie,
      _reason,
      _age,
      _numberWorker,
      _Symptoms,
      _numberWorkerafter;

  final _store = Store();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context).settings.arguments;
    var tr = ENGLISH;
    return Directionality(
      textDirection:  tr == ENGLISH ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 60, bottom: 10),
                child: FlatButton(
                  child: Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Form(
                key: _globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _name = value;
                        },
                        hint: getTranslated(context, "CoronaVirus"),
                        textlaple: getTranslated(context, "diseaseName")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _location = value;
                        },
                        textlaple: getTranslated(context, "placeOfSpread"),
                        hint: getTranslated(
                            context, "China - Egypt - Saudi Arabia")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _treatment = value;
                        },
                        hint: getTranslated(context, "Use a mask"),
                        textlaple: getTranslated(context, "TreatmentMethod")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _numberWorker = value;
                        },
                        hint: "15000",
                        textlaple: getTranslated(context, "Number of injured")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _numberWorkerafter = value;
                        },
                        hint: "15000",
                        textlaple: getTranslated(context, "healing number")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _numberdie = value;
                        },
                        hint: "15000",
                        textlaple: getTranslated(context, "number of dead")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _Symptoms = value;
                        },
                        textlaple: getTranslated(context, "Symptoms"),
                        hint: getTranslated(context, "high temperature")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _reason = value;
                        },
                        textlaple:
                            getTranslated(context, "The reason for the spread"),
                        hint: getTranslated(context,
                            "Infection of some birds with a certain disease")),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _age = value;
                        },
                        textlaple: getTranslated(
                            context, "The ages that are affected"),
                        hint: "15-20"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _linkVid = value;
                          launch(_linkVid);
                        },
                        textlaple: getTranslated(context, "video link"),
                        hint: "https://www.youtube.com/watch?v=fiJ09ylwTqc"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onClick: (value) {
                          _date = value;
                        },
                        textlaple: getTranslated(context, "Deployment date"),
                        hint: "10/10/2010"),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: OriginalButton(
                        text: getTranslated(context, "addEdits"),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                            _store.editPost({
                              kPostName: _name,
                              kPostNumberWorker: _numberWorker,
                              kPostType: _treatment,
                              kPostLocation: _location,
                              kPostpSymptoms: _Symptoms,
                              kPostNumberWorkerAfter: _numberWorkerafter,
                              kpostpreason: _reason,
                              kPostnumberdie: _numberdie,
                              kPostDate: _date,
                              kPostAge: _age,
                              kPostlinkVid: _linkVid
                            }, post.pId);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreenAdmain(),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
