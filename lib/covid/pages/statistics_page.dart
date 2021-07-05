import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_register_auth/covid/core/consts_colors.dart';
import 'package:login_register_auth/covid/widgets/chart_widget.dart';
import 'package:login_register_auth/covid/widgets/custom_appbar.dart';
import 'package:login_register_auth/localization/localization_methods.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  Map worldData;

  fetchWorldWideData() async {
    WidgetsFlutterBinding.ensureInitialized();
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWorldWideData();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Container(
              height: 275,
              padding: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Image.asset("assets/images/virus2.png"),
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              child: ListView(
                children: [
                  CustomAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      getTranslated(context, "STATISTICS"),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  _buildStatistic(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                            child: _builderGender(
                                "assets/images/m.png",
                                Colors.orangeAccent,
                                getTranslated(context, "Male"),
                                "55.5%")),
                        SizedBox(width: 16),
                        Expanded(
                          child: _builderGender(
                              "assets/images/f.png",
                              Colors.pinkAccent,
                              getTranslated(context, "Female"),
                              "44.5%"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      text: TextSpan(
                        text: getTranslated(context, "Global Cases of"),
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 170,
                      child:
                          Center(child: Image.asset("assets/images/map.png")),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(24),
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
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 150,
              child: DonutPieChart.withSampleData(),
            ),
            SizedBox(width: 25),
            worldData == null
                ? CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatisticItem(
                          Colors.blueAccent,
                          getTranslated(context, "Confirmed"),
                          worldData['cases'].toString()),
                      _buildStatisticItem(
                          Colors.yellowAccent,
                          getTranslated(context, "Recovered"),
                          worldData['recovered'].toString()),
                      _buildStatisticItem(
                          Colors.redAccent,
                          getTranslated(context, "Deaths"),
                          worldData['deaths'].toString()),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(Color color, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.label_important,
          size: 45,
          color: color,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            SizedBox(height: 5),
            Text(value),
          ],
        ),
      ],
    );
  }

  Widget _builderGender(String image, Color color, String title, String value) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 50,
                  height: 50,
                  color: color,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      getTranslated(context, "Confirmed Cases"),
                      style: TextStyle(
                        color: Colors.black38,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 36,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
