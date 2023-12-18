import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/config.dart';
import 'TabChart.dart';
class statistics extends StatefulWidget {
  const statistics({super.key});

  @override
  State<statistics> createState() => _statisticsState();
}

void onPressed(String msg){
  print(msg);
}

class ChartData {
  late int _x;
  late double _y;

  ChartData(int x, double y){
    _x = x;
    _y = y;
  }
}
class _statisticsState extends State<statistics> {
  bool check_wind = true;
  bool check_solar = true;
  bool check_regular = true;
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartdaily = <ChartData>[
      ChartData(2010, 3.3),
      ChartData(2011, 5.4),
      ChartData(2012, 2.65),
      ChartData(2013, 2.62),
      ChartData(2014, 1.99),
      ChartData(2015, 1.44),
      ChartData(2016, 2),
      ChartData(2017, 1.56),
      ChartData(2018, 2.1),
    ];
    //week
    final List<ChartData> chartweekwind = <ChartData>[
      ChartData(12, 3.3),
      ChartData(13, 5.4),
      ChartData(14, 2.65),
      ChartData(15, 2.62),
      ChartData(16, 1.99),
      ChartData(17, 1.44),
      ChartData(18, 2),
    ];
    final List<ChartData> chartweeksolar = <ChartData>[
      ChartData(12, 2.3),
      ChartData(13, 6.4),
      ChartData(14, 1.65),
      ChartData(15, 4.62),
      ChartData(16, 3.99),
      ChartData(17, 1.44),
      ChartData(18, 5),
    ];
    final List<ChartData> chartweekregular = <ChartData>[
      ChartData(12, 1.3),
      ChartData(13, 2.4),
      ChartData(14, 6.65),
      ChartData(15, 5.62),
      ChartData(16, 1.99),
      ChartData(17, 7.44),
      ChartData(18, 3),
    ];


    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/second.png"),
              fit: BoxFit.cover,
            ),
          ),
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
                            child: Text("Statistics", style: TextStyle(
                                fontSize: 30,
                                height: 1.2,
                                color: Colors.black
                            ),)
                        )
                      ] ,
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 97),
                  child: Column(
                    children: [
                      Text(
                        "Wh generated",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            height: 1.3
                        ),
                      ),
                      Text(
                        "19562",
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.black,
                            height: 1.1
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Icon(Icons.arrow_drop_down, color: Color(0xFFE33762),),
                            Text(
                              "2131Wh (14%)",
                              style: TextStyle(
                                  fontSize: 12,
                                  height: 1.3,
                                  color: Color(0xFFE33762)
                              ),
                            ),
                          ]
                      ),
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: tabChart(chartweekwind, chartweeksolar, chartweekregular,
                            chartweekwind, chartweeksolar, chartweekregular,
                            chartweekwind, chartweeksolar, chartweekregular,
                            chartweekwind, chartweeksolar, chartweekregular),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: InkWell(
                            onTap: ()=>setState(() {
                              check_wind = !check_wind;
                            }),
                            child: ListTile(
                                leading: Checkbox(
                                  value: check_wind,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      check_wind = value!;
                                    });
                                  },),
                                title: Text("Wind power", style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFA9A9A9)
                                ),)
                            ),
                          )),
                          Expanded(child: InkWell(
                            onTap: ()=>setState(() {
                              check_solar = !check_solar;
                            }),
                            child: ListTile(
                                leading: Checkbox(
                                  value: check_solar,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      check_solar = value!;
                                    });
                                  },),
                                title: Text("Solar power", style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFA9A9A9)
                                ),)
                            ),
                          )),
                          Expanded(child: InkWell(
                            onTap: ()=>setState(() {
                              check_regular = !check_regular;
                            }),
                            child: ListTile(
                                leading: Checkbox(
                                  value: check_regular,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      check_regular = value!;
                                    });
                                  },),
                                title: Text("Regular provider", style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFA9A9A9)
                                ),)
                            ),
                          )),


                        ],
                      )
                    ],
                  ),
                ),

              ]
          ),
        ),


    );

  }
  Widget tabChart(
      List<ChartData> chartdatawindddaily, List<ChartData> chartdatasolardaily, List<ChartData> chartdataregulardaily,
      List<ChartData> chartdatawindweekly, List<ChartData> chartdatasolarweekly, List<ChartData> chartdataregularweekly,
      List<ChartData> chartdatawindmonthly, List<ChartData> chartdatasolarmonthly, List<ChartData> chartdataregularmonthly,
      List<ChartData> chartdatawindalltime, List<ChartData> chartdatasolaralltime, List<ChartData> chartdataregularalltime){
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
            tabs: [
              Tab(text: "Daily",),
              Tab(text: "Weekly",),
              Tab(text: "Monthly",),
              Tab(text: "All time",),
            ],
        ),
        body: Column(
          children: <Widget>[
              Expanded(child:  TabBarView(
                children: [
                  Center(
                    child: SfCartesianChart(
                            series: <ChartSeries>[
                              check_wind?
                              SplineAreaSeries<ChartData, int>(
                                  dataSource: chartdatawindddaily,
                                  xValueMapper: (ChartData data, _) => data._x,
                                  yValueMapper: (ChartData data, _) => data._y
                              ):SplineAreaSeries<ChartData, int>(
                                  dataSource: [],
                                  xValueMapper: (ChartData data, _) => data._x,
                                  yValueMapper: (ChartData data, _) => data._y
                              ),
                              check_solar?
                              SplineAreaSeries<ChartData, int>(
                                  dataSource: chartdatasolardaily,
                                  xValueMapper: (ChartData data, _) => data._x,
                                  yValueMapper: (ChartData data, _) => data._y
                              ):SplineAreaSeries<ChartData, int>(
                                  dataSource: [],
                                  xValueMapper: (ChartData data, _) => data._x,
                                  yValueMapper: (ChartData data, _) => data._y
                              ),
                              check_regular?
                              SplineAreaSeries<ChartData, int>(
                                  dataSource: chartdataregulardaily,
                                  xValueMapper: (ChartData data, _) => data._x,
                                  yValueMapper: (ChartData data, _) => data._y
                              ):SplineAreaSeries<ChartData, int>(
                                  dataSource: [],
                                  xValueMapper: (ChartData data, _) => data._x,
                                  yValueMapper: (ChartData data, _) => data._y
                              ),
                      ],
                    )
                  ),
                  Center(
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          check_wind?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdatawindweekly,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                          check_solar?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdatasolarweekly,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                          check_regular?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdataregularweekly,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                        ],
                      )
                  ),
                  Center(
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          check_wind?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdatawindmonthly,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                          check_solar?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdatasolarmonthly,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                          check_regular?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdataregularmonthly,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                        ],
                      )
                  ),
                  Center(
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          check_wind?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdatawindalltime,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                          check_solar?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdatasolaralltime,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                          check_regular?
                          SplineAreaSeries<ChartData, int>(
                              dataSource: chartdataregularalltime,
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ):SplineAreaSeries<ChartData, int>(
                              dataSource: [],
                              xValueMapper: (ChartData data, _) => data._x,
                              yValueMapper: (ChartData data, _) => data._y
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
