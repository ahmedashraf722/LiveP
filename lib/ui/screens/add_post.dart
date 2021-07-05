import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:login_register_auth/model/post.dart';
import 'package:login_register_auth/services/Store.dart';
import 'package:login_register_auth/ui/widgets/customTextFeild.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../widgets/original_button.dart';
import 'home_screenAdmin.dart';

class AddPost extends StatelessWidget {
  static const String id = "AddPost";
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
    var tr = ENGLISH;
    return Directionality(
      textDirection: tr == ENGLISH ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
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

                // IconButton(
                //     icon: Icon(Icons.arrow_back_ios_outlined),
                //     onPressed: () {
                //       Navigator.pushReplacementNamed(context, "home");
                //     }),
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
                          _date = value;
                        },
                        textlaple: getTranslated(context, "Deployment date"),
                        hint: "10/10/2010"),
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
                        },
                        textlaple: getTranslated(context, "video link"),
                        hint: "https://www.youtube.com/watch?v=fiJ09ylwTqc"),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: OriginalButton(
                        text: getTranslated(context, "add disease"),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                            _store.addPost(Post(
                              pName: _name,
                              pDate: _date,
                              pAddrees: _location,
                              pNumberWorker: _numberWorker,
                              pnumberWorkerafter: _numberWorkerafter,
                              pSymptoms: _Symptoms,
                              Ptreatment: _treatment,
                              Pnumberdie: _numberdie,
                              preason: _reason,
                              Page: _age,
                              plinkVid: _linkVid,
                            ));
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
