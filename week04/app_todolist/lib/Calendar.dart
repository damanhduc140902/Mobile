import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:table_calendar/table_calendar.dart';

import 'Mine.dart';
import 'TableCalendar.dart';


class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LchWidget - FRAME
    return Container(



        width: 428,
        height: 926,

        decoration: BoxDecoration(

          boxShadow : [BoxShadow(

              color: Color.fromRGBO(0,0,0, 0.25),
              offset: Offset(0,4),
              blurRadius: 4
          )],
          //color : Color.fromRGBO(255,255,255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 428,
                    height: 830,
                   // color : Color.fromRGBO(235, 245, 254, 1),
                    child: Stack(
                      children: <Widget>[
                        Table_Calendar(),
                      ]
                    )
                  )
              ),Positioned(
                  top: 836.2937622070312,
                  left: 0,
                  child: Container(
                      width: 428,
                      height: 143.30328369140625,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 428,
                                    height: 89.22396087646484,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(253, 255, 254, 1),
                                    )
                                )
                            ),Positioned(
                              top: 33.7603759765625,
                              left: 19.814815521240234,
                              child: Icon(Icons.menu,
                                size: 29, color: Color.fromRGBO(158, 163, 169, 0.800000011920929),
                              ),
                            ),Positioned(
                                top: 24,
                                left: 340,
                                child: Container(
                                    width: 40,
                                    height: 119,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 5,
                                            left: 10,
                                            child: Icon(Icons.person,
                                              size:19.25, color: Color.fromRGBO(0, 0, 0, 0.5),
                                            ),

                                          ),Positioned(
                                              top: 39.591796875,
                                              left: 7,
                                              child: Text('Mine', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                  fontFamily: 'Gothic A1',
                                                  fontSize: 10,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 24,
                                left: 228,
                                child: Container(
                                    width: 40,
                                    height: 119,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 5,
                                            left: 10,
                                            child: Icon(Icons.calendar_today,
                                              size:20, color: Color.fromRGBO(0, 0, 0, 0.5),
                                            ),
                                          ),Positioned(
                                              top: 40,
                                              left: 0,
                                              child: Text('Calendar', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                  fontFamily: 'Gothic A1',
                                                  fontSize: 10,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 24,
                                left: 116,
                                child: Container(
                                    width: 40,
                                    height: 119,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 5,
                                            left: 5,
                                            child: Icon(Icons.assignment,
                                                size: 20, color: Color.fromRGBO(0, 0, 0, 0.5)
                                            ),
                                          ),Positioned(
                                              top: 39.591796875,
                                              left: 0,
                                              child: Text('Tasks', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                  fontFamily: 'Gothic A1',
                                                  fontSize: 10,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),
              // ,Positioned(
              //     top: 723,
              //     left: 341,
              //     child: Container(
              //         width: 63,
              //         height: 77,
              //
              //         child: Stack(
              //             children: <Widget>[
              //               Positioned(
              //                   top: 0,
              //                   left: 0,
              //                   child: Container(
              //                       width: 63,
              //                       height: 77,
              //                       decoration: BoxDecoration(
              //                         color : Color.fromRGBO(125, 171, 246, 1),
              //                         borderRadius : BorderRadius.all(Radius.elliptical(63.407405853271484, 77.16666412353516)),
              //                       )
              //                   )
              //               ),
              //               // Positioned(
              //               //     top: 48,
              //               //     left: 32,
              //               //     child: Transform.rotate(
              //               //       angle: 90.00000000000007 * (math.pi / 180),
              //               //       child: Divider(
              //               //           color: Color.fromRGBO(253, 255, 254, 1),
              //               //           thickness: 5
              //               //       )
              //               //       ,
              //               //     )
              //               // ),
              //               // Positioned(
              //               //     top: 40.99481201171875,
              //               //     left: 24.9666748046875,
              //               //     child: Divider(
              //               //         color: Color.fromRGBO(253, 255, 254, 1),
              //               //         thickness: 5
              //               //     )
              //               // ),
              //               // Positioned(
              //               //   top: 23,
              //               //   left: 16,
              //               //   child: Icon(Icons.add,
              //               //     color: Color.fromRGBO(255, 255, 255, 1),
              //               //     //thickness: 5
              //               //     size:30,
              //               //   ),
              //               // ),
              //             ]
              //         )
              //     )
              // ),
            ]
        )
    );
  }
}

