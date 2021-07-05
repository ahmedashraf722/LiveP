import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_auth/covid/core/consts_colors.dart';
import 'package:login_register_auth/covid/pages/statistics_page.dart';
import 'package:login_register_auth/covid/widgets/custom_appbar.dart';
import 'package:login_register_auth/localization/localization_methods.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: Stack(
                  children: [
                    Image.asset("assets/images/virus2.png"),
                    _buildHeader(context),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                text: TextSpan(
                    text: getTranslated(context, "Symptoms off"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: " ",
                        style: TextStyle(
                          color: AppColors.mainColor,
                        ),
                      ),
                      TextSpan(
                        text: getTranslated(context, "COVID 19"),
                        style: TextStyle(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                physics: BouncingScrollPhysics(),
                children: [
                  _buildSymptomItem(
                      "assets/images/1.png", getTranslated(context, "Fever")),
                  _buildSymptomItem("assets/images/2.png",
                      getTranslated(context, "Dry Cough")),
                  _buildSymptomItem("assets/images/3.png",
                      getTranslated(context, "Headache")),
                  _buildSymptomItem("assets/images/4.png",
                      getTranslated(context, "Breathless")),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
               getTranslated(context,"PreventionP"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                physics: BouncingScrollPhysics(),
                children: [
                  _buildPrevention(
                    "assets/images/a10.png",
                   getTranslated(context,  "WASH"),
                    getTranslated(context, "hands often"),
                  ),
                  _buildPrevention(
                    "assets/images/a4.png",
                    getTranslated(context, "COVER"),
                    getTranslated(context, "your cough"),
                  ),
                  _buildPrevention(
                    "assets/images/a6.png",
                    getTranslated(context, "ALWAYS"),
                   getTranslated(context,  "clean"),
                  ),
                  _buildPrevention(
                    "assets/images/a9.png",
                    getTranslated(context,"USE"),
                   getTranslated(context,  "mask"),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatisticsPage()));
              },
              child: Container(
                height: 90,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/map.png"),
                    SizedBox(width: 25),
                    RichText(
                      text: TextSpan(
                        text: getTranslated(context, "CASES\n"),
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: getTranslated(context, "Overview Worldwide\n"),
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: getTranslated(context,"190.119.900 confirmed"),
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            getTranslated(context, "COVID 19"),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            getTranslated(context, "Coronavirus Relief Fund"),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            getTranslated(context, "dd"),
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    launch(
                        'https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');
                  },
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.blue,
                  child: Text(
                    getTranslated(context, "DONATE NOW"),
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    launch('https://covid19responsefund.org/en/');
                  },
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.red,
                  child: Text(
                    getTranslated(context, "EMERGENCY"),
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSymptomItem(String path, String text) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.backgroundColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Image.asset(path),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPrevention(String path, String text1, String text2) {
    return Column(
      children: [
        Container(
          width: 170,
          height: 80,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(path),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: "$text1\n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "$text2\n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 7),
      ],
    );
  }
}
