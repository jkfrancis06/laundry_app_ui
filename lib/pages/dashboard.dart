import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app_ui/models/sizeConfig.dart';
import 'package:laundry_app_ui/utils/constants.dart';
import 'package:laundry_app_ui/widgets/dashboard/user_health_status.dart';
import 'package:laundry_app_ui/widgets/dashboard/user_top_card.dart';
import 'package:laundry_app_ui/widgets/general/general_app_bar.dart';
import 'package:laundry_app_ui/widgets/latest_orders.dart';
import 'package:laundry_app_ui/widgets/location_slider.dart';

class Dashboard extends StatefulWidget {
  @override

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Track active index
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          Icon(
            FlutterIcons.ios_home_ion,
            size: 30.0,
            color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.map_marker_radius_mco,
            size: 30.0,
            color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.plus_ant,
            size: 30.0,
            color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.heart_fea,
            size: 30.0,
            color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.setting_ant,
            size: 30.0,
            color: activeIndex == 4 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
              children: [
                Image.asset(
                  'assets/images/covid.png',
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  Constants.appName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(18)
                  ),
                )
              ]
          ),
        ),
        backgroundColor: Constants.scaffoldBackgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0,0,5,0),
            child: Row(
              children: [
                OutlinedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text(
                      "Besoin d'aide ?",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight / 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: UserTopCard(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      children: [
                        Flexible(child: Text(
                          'Mon carnet de sant??',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.leadingFontSize
                          ),
                        )),
                      ],
                    ),
                  ),

                  Container(
                    child: Center(
                      // lets make a widget for the cards
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: UserHealthStatus(),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
