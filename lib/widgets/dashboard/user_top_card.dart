import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app_ui/models/user.dart';
import 'package:laundry_app_ui/utils/constants.dart';
import 'package:laundry_app_ui/widgets/order_card.dart';

class UserTopCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final User user = User(
        firstname: 'Ahmed',
        lastname: 'Ibrahima'.toUpperCase(),
        country: 'Comoros',
        passportNumber: 'EB33432',
        phoneNumber: '+2693355558',
        gender: 0,
        birthdate: DateTime(1990,05,22)
    );


    return Container(
      child: Container(
        height: ScreenUtil().setHeight(238.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/user_card.png',
            ),
            fit: BoxFit.fill,

          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: ScreenUtil().setWidth(60.0),
                    height: ScreenUtil().setHeight(60.0),
                    child: Image.asset('assets/images/user_icon.png')
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(5.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Flexible(child: Text(
                              user.firstname +' '+ user.lastname ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(19.0),
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5.0),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.assistant_photo_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(5.0),
                            ),
                            Text(
                              user.country,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(17.0) ,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5.0),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.assignment_ind_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(5.0),
                            ),
                            Text(
                              user.passportNumber,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(17.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5.0),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(5.0),
                            ),
                            Text(
                              user.phoneNumber,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(17.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 20,
              thickness: 1.0,
              indent: 5,
              endIndent: 5,
            ),
            Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(150.0),
                  child: Column(
                    children: [
                      Text(
                        'Sexe :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(17.0),
                        ),
                      ),
                      Text(
                        user.phoneNumber,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(17.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(150.0),
                  child: Column(
                    children: [
                      Text(
                        'Âge :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(17.0),
                        ),
                      ),
                      Text(
                        "22 Années" ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(17.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );

    _getSex

  }
}
