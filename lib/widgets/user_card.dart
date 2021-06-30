import 'package:flutter/material.dart';
import 'package:laundry_app_ui/models/user.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class UserCard extends StatelessWidget {

  final List<User> users = [
    User(
     firstname: 'John',
     lastname: 'Doe',
     country: 'Comoros',
     passportNumber: 'EB33432',
     phoneNumber: '+2693355558',
     birthdate: DateTime(1990,05,22)
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15.0,
              );
            },
          )
          // Let's create an order model
        ],
      ),
    );
  }
}
