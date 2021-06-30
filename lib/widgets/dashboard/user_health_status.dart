import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app_ui/models/healthStatus.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class UserHealthStatus extends StatelessWidget {

  final DateFormat formatter = DateFormat("dd-MM-yyyy");
  
   @override
   Widget build(BuildContext context) {

     List<HealthStatus> healthStatus = [
       HealthStatus(
           testDate: null,
           testSatuts: TestResult.TEST_NULL
       ),
       HealthStatus(
           testDate: DateTime(2021,06,21),
           testSatuts: TestResult.TEST_NEG
       ),
       HealthStatus(
           testDate: DateTime(2021,06,14),
           testSatuts: TestResult.TEST_POS
       )
     ];



     return Container(
       height: MediaQuery.of(context).size.height * 0.30,
       child: ListView.separated(
           physics: BouncingScrollPhysics(),
           padding: EdgeInsets.symmetric(horizontal: 24.0),
           scrollDirection: Axis.horizontal,
           itemBuilder:(BuildContext context, int index ) {
             return GestureDetector(
                 onTap: (){
                   final snackBar = SnackBar(content: Text('Tap'));
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 },
                 child:
                 Column(
                   children: [
                     SizedBox(
                       height: 10.0,
                     ),
                     Container(
                       height: MediaQuery.of(context).size.height * 0.25,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8.0),
                       ),
                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: MediaQuery.of(context).size.width * 0.30,
                             child: Column(
                               children: [
                                 SizedBox(
                                   child: Text(
                                     'Date du test',
                                     style: TextStyle(
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                 ),
                                 Text(
                                     healthStatus[index].testDate == null  ? "--" : formatter.format(healthStatus[index].testDate)
                                 ),
                                 SizedBox(
                                   child: Text(
                                     'Resultat du test',
                                     style: TextStyle(
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                 ),
                                 Text(
                                     _getResultString(healthStatus[index].testSatuts)
                                 ),
                               ],
                             ),

                           ),
                           SizedBox(
                             width: MediaQuery.of(context).size.width * 0.20,
                           ),
                           Container(
                             width: MediaQuery.of(context).size.width * 0.30,
                             child: Image.asset(
                                 _getQrImage(healthStatus[index].testSatuts)
                             ),

                           ),

                         ],
                       ),
                     ),
                   ],
                 )
             );
           },
           separatorBuilder: (BuildContext context, int index) {
             return SizedBox(
               width: 15.0,
             );
           },
           itemCount: healthStatus.length),
     );



   }

   String _getQrImage(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return 'assets/images/qr_code_green.png';
       case TestResult.TEST_POS:
         return 'assets/images/qr_code_red.png';
       default:
         return 'assets/images/qr_code_gray.png';
     }
   }

   String _getResultString(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return 'Négatif';
       case TestResult.TEST_POS:
         return 'Positif';
       default:
         return '---';
     }
   }


 }

