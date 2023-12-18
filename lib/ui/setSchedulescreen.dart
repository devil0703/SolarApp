import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';
class setSchedulescreen extends StatefulWidget {
  const setSchedulescreen({super.key});

  @override
  State<setSchedulescreen> createState() => _setSchedulescreenState();
}
class DailyClass{
  late int day;
  late String date;
  DailyClass(int _day, String _date){
    day = _day;
    date = _date;
  }
}
class _setSchedulescreenState extends State<setSchedulescreen> {
  bool _isDailyCollapsed = false;
  bool _isWeeklyCollapsed = true;
  bool _isMonthlyCollapsed = true;
  void toggleCollapseDaily() {
    setState(() {
      _isDailyCollapsed = !_isDailyCollapsed;
      _isWeeklyCollapsed = _isWeeklyCollapsed? _isWeeklyCollapsed: !_isWeeklyCollapsed;
      _isMonthlyCollapsed = _isMonthlyCollapsed? _isMonthlyCollapsed: !_isMonthlyCollapsed;
    });
  }
  void toggleCollapseWeekly() {
    setState(() {
      _isWeeklyCollapsed = !_isWeeklyCollapsed;
      _isDailyCollapsed = _isDailyCollapsed? _isDailyCollapsed: !_isDailyCollapsed;
      _isMonthlyCollapsed = _isMonthlyCollapsed? _isMonthlyCollapsed: !_isMonthlyCollapsed;
    });
  }
  void toggleCollapseMonthly() {
    setState(() {
      _isMonthlyCollapsed = !_isMonthlyCollapsed;
      _isWeeklyCollapsed = _isWeeklyCollapsed? _isWeeklyCollapsed: !_isWeeklyCollapsed;
      _isDailyCollapsed = _isDailyCollapsed? _isDailyCollapsed: !_isDailyCollapsed;
    });
  }
  List<DailyClass> dailys = [];
  int _currentDayIndex = 0;
  int _currentWeekIndex = 0;
  int _currentMonthIndex = 0;
  List<String> dates = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "So"];
  void onPressed(){
    print("Hello");
  }
  List<String> weeks = ["1", "2", "3", "4", "5"];
  List<String> months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
  List<String> months_en = ["Ja", "Fe", "Ma", "Ap", "Ma", "Ju", "Ju", "Au", "Se", "Oc", "No", "De"];
  //sample data
  @override
  Widget build(BuildContext context) {

    for(int i=1; i<=31;i++){
      DailyClass dailyClass = DailyClass(i, dates[i%7]);
      dailys.add(dailyClass);
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/second.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width,
                  // Set the width of the row
                ),
                child: SizedBox(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 76),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: ()=>Get.toNamed(AppLinks.mainscreen.path),
                                          child: Image.asset(
                                            'assets/images/back.png',
                                            width: 24,
                                            height: 36,
                                          ),
                                        )
                                    )
                                ),
                                Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Text("Set Schedule", style: TextStyle(
                                        fontSize: 30,
                                        height: 1.2,
                                        color: Colors.black
                                    ),)
                                )
                              ],
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20, top: 27),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      maximumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                                      minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.grey, width: 0.5)// Adjust the border radius as needed
                                        ),
                                      ),
                                      backgroundColor: _isDailyCollapsed? MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)) : MaterialStateProperty.all<Color>(Color(0xFF5062A0))
                                  ),
                                  onPressed: toggleCollapseDaily,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Daily',
                                        style: TextStyle(
                                            fontSize: 20,
                                            height: 1.6,
                                            color: _isDailyCollapsed? Colors.black : Colors.white
                                        ),
                                      ),
                                      _isDailyCollapsed? Icon(Icons.arrow_right,color: Colors.black):Icon(Icons.arrow_drop_down,color: Colors.white)
                                    ],
                                  )
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300), // Animation duration
                                curve: Curves.easeInOut, // Animation curve
                                width: 332,
                                padding: EdgeInsets.only(top: 72),
                                height: _isDailyCollapsed ? 0 : 474, // Toggle the height
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          height: 79,
                                          child:CarouselSlider(
                                            options: CarouselOptions(
                                              viewportFraction: 0.15, // Set the fraction of the viewport (screen) that the slide should occupy
                                              enlargeCenterPage: false, // Ensure the center item is not enlarged
                                              onPageChanged: (index, _) {
                                                setState(() {
                                                  _currentDayIndex = index;
                                                });
                                              },
                                            ),
                                            items: dailys.map((item) {
                                              return Builder(
                                                builder: (BuildContext context) {
                                                  return Center(
                                                      child: Container(
                                                          width: 53,
                                                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(16),
                                                            color: _currentDayIndex == dailys.indexOf(item) ? Color(0xFFB9C0DD) : Color(0xFFFFFFFF),
                                                          ),
                                                          child: Center(
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Text(item.day.toString(), style: TextStyle(
                                                                        fontSize: 20,
                                                                        height: 1.3,
                                                                        color: _currentDayIndex == dailys.indexOf(item) ? Colors.white : Colors.black
                                                                    )),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Text(item.date, style: TextStyle(
                                                                        fontSize: 14,
                                                                        height: 1.3,
                                                                        color: _currentDayIndex == dailys.indexOf(item) ? Colors.white : Colors.grey
                                                                    )),
                                                                  ),
                                                                ]
                                                            ),
                                                          )

                                                      )
                                                  );

                                                },
                                              );
                                            }).toList(),
                                          )
                                      ),
                                      Container(
                                        width: 203,
                                        height: 60,
                                        margin: EdgeInsets.only(top: 220),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF5062A0),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: InkWell(
                                            onTap: onPressed,
                                            child:
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text("Save", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  height: 1.16
                                              )),
                                            )
                                        ),
                                      )
                                    ],

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20, top: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      maximumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                                      minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.grey, width: 0.5)// Adjust the border radius as needed
                                        ),
                                      ),
                                      backgroundColor: _isWeeklyCollapsed? MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)) : MaterialStateProperty.all<Color>(Color(0xFF5062A0))
                                  ),
                                  onPressed: toggleCollapseWeekly,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Weekly',
                                        style: TextStyle(
                                            fontSize: 20,
                                            height: 1.6,
                                            color: _isWeeklyCollapsed? Colors.black : Colors.white
                                        ),
                                      ),// Adjust the space between text and icon
                                      _isWeeklyCollapsed? Icon(Icons.arrow_right,color: Colors.black):Icon(Icons.arrow_drop_down,color: Colors.white)
                                    ],
                                  )
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300), // Animation duration
                                curve: Curves.easeInOut, // Animation curve
                                width: 332,
                                padding: EdgeInsets.only(top: 72),
                                height: _isWeeklyCollapsed ? 0 : 474, // Toggle the height
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          height: 79,
                                          child:CarouselSlider(
                                            options: CarouselOptions(
                                              viewportFraction: 0.15, // Set the fraction of the viewport (screen) that the slide should occupy
                                              enlargeCenterPage: false, // Ensure the center item is not enlarged
                                              onPageChanged: (index, _) {
                                                setState(() {
                                                  _currentWeekIndex = index;
                                                });
                                              },
                                            ),
                                            items: weeks.map((item) {
                                              return Builder(
                                                builder: (BuildContext context) {
                                                  return Center(
                                                      child: Container(
                                                          width: 53,
                                                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(16),
                                                            color: _currentWeekIndex == weeks.indexOf(item) ? Color(0xFFB9C0DD) : Color(0xFFFFFFFF),
                                                          ),
                                                          child: Center(
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Text(item, style: TextStyle(
                                                                        fontSize: 20,
                                                                        height: 1.3,
                                                                        color: _currentWeekIndex == weeks.indexOf(item) ? Colors.white : Colors.black
                                                                    )),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Text("week", style: TextStyle(
                                                                        fontSize: 14,
                                                                        height: 1.3,
                                                                        color: _currentWeekIndex == weeks.indexOf(item) ? Colors.white : Colors.grey
                                                                    )),
                                                                  ),
                                                                ]
                                                            ),
                                                          )

                                                      )
                                                  );

                                                },
                                              );
                                            }).toList(),
                                          )
                                      ),
                                      Container(
                                        width: 203,
                                        height: 60,
                                        margin: EdgeInsets.only(top: 220),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF5062A0),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: InkWell(
                                            onTap: onPressed,
                                            child:
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text("Save", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  height: 1.16
                                              )),
                                            )
                                        ),
                                      )
                                    ],

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20, top: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                                      maximumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.grey, width: 0.5)// Adjust the border radius as needed
                                        ),
                                      ),
                                      backgroundColor: _isMonthlyCollapsed? MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)) : MaterialStateProperty.all<Color>(Color(0xFF5062A0))
                                  ),
                                  onPressed: toggleCollapseMonthly,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Monthly',
                                        style: TextStyle(
                                            fontSize: 20,
                                            height: 1.6,
                                            color: _isMonthlyCollapsed? Colors.black : Colors.white
                                        ),
                                      ), // Adjust the space between text and icon
                                      _isMonthlyCollapsed? Icon(Icons.arrow_right,color: Colors.black):Icon(Icons.arrow_drop_down,color: Colors.white)
                                    ],
                                  )
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300), // Animation duration
                                curve: Curves.easeInOut, // Animation curve
                                width: 332,
                                padding: EdgeInsets.only(top: 72),
                                height: _isMonthlyCollapsed ? 0 : 474, // Toggle the height
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          height: 79,
                                          child:CarouselSlider(
                                            options: CarouselOptions(
                                              viewportFraction: 0.15, // Set the fraction of the viewport (screen) that the slide should occupy
                                              enlargeCenterPage: false, // Ensure the center item is not enlarged
                                              onPageChanged: (index, _) {
                                                setState(() {
                                                  _currentMonthIndex = index;
                                                });
                                              },
                                            ),
                                            items: months.map((item) {
                                              return Builder(
                                                builder: (BuildContext context) {
                                                  return Center(
                                                      child: Container(
                                                          width: 53,
                                                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(16),
                                                            color: _currentMonthIndex == months.indexOf(item) ? Color(0xFFB9C0DD) : Color(0xFFFFFFFF),
                                                          ),
                                                          child: Center(
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Text(item, style: TextStyle(
                                                                        fontSize: 20,
                                                                        height: 1.3,
                                                                        color: _currentMonthIndex == months.indexOf(item) ? Colors.white : Colors.black
                                                                    )),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Text(months_en[months.indexOf(item)], style: TextStyle(
                                                                        fontSize: 14,
                                                                        height: 1.3,
                                                                        color: _currentMonthIndex == months.indexOf(item) ? Colors.white : Colors.grey
                                                                    )),
                                                                  ),
                                                                ]
                                                            ),
                                                          )

                                                      )
                                                  );

                                                },
                                              );
                                            }).toList(),
                                          )
                                      ),
                                      Container(
                                        width: 203,
                                        height: 60,
                                        margin: EdgeInsets.only(top: 220),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF5062A0),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: InkWell(
                                            onTap: onPressed,
                                            child:
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text("Save", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  height: 1.16
                                              )),
                                            )
                                        ),
                                      )
                                    ],

                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ))
        )
      )
      );
  }

}
