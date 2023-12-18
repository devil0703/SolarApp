import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:testproject/utils/config.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Device{
  late String Vilnius;
  late String Consumption;
  late String Coverage;
  late String Asset_added;
  Device(String _vilnius, String _consumption, String _coverage, String _asset_added){
    Vilnius = _vilnius;
    Consumption = _consumption;
    Coverage = _coverage;
    Asset_added = _asset_added;
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    List<Device> devices = [];
    Device device1 = Device("Kanceliarijos str 45-13", "1- 260 kWh/month", "100%", "2018-02-17");
    Device device2 = Device("Kanceliarijos str 45-13", "1- 260 kWh/month", "100%", "2018-02-17");
    Device device3 = Device("Kanceliarijos str 45-13", "1- 260 kWh/month", "100%", "2018-02-17");
    Device device4 = Device("Kanceliarijos str 45-13", "1- 260 kWh/month", "100%", "2018-02-17");
    Device device5 = Device("Kanceliarijos str 45-13", "1- 260 kWh/month", "100%", "2018-02-17");
    devices.add(device1);
    devices.add(device2);
    devices.add(device3);
    devices.add(device4);
    devices.add(device5);
    return Scaffold(
        body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/first.png"),
                fit: BoxFit.cover,
              ),
            ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: 400, // Set the width of the row
            ),
            child: new Column(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20, top: 30),
                    child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () => Get.toNamed(AppLinks.mainscreen.path),
                        child: IconButton(
                          icon: Image.asset('assets/images/settings.png'),
                          iconSize: 24,
                          onPressed: () {},
                        )
                    ),
                  )
                ),
                buildCustomAdd(),
                Container(
                  height: 200,
                  child: CarouselSlider.builder(itemCount: devices.length,
                      itemBuilder: (BuildContext context, int itemIndex, int i) => Container(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: _currentIndex == itemIndex ? Color(0xFF5062A0) : Color(0xFFE8E8E8),
                          ),
                          child:Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(devices[itemIndex].Vilnius, style: TextStyle(
                                              fontSize: 20,
                                              height: 1.6,
                                              color: _currentIndex == itemIndex ? Colors.white : Colors.black
                                          )),
                                          Text("Vilnius", style: TextStyle(
                                              fontSize: 12,
                                              height: 1.6,
                                              color: _currentIndex == itemIndex ? Colors.white : Colors.grey
                                          )),
                                          Divider(
                                            color: _currentIndex == itemIndex ? Colors.white : Colors.grey,
                                            height: 10,
                                            thickness: 1,
                                            indent: 0,
                                            endIndent: 0,
                                          ),
                                        ]
                                    )

                                ),
                                Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(devices[itemIndex].Consumption, style: TextStyle(
                                                    fontSize: 14,
                                                    color: _currentIndex == itemIndex ? Colors.white : Colors.black,
                                                    height: 1.6
                                                )),
                                                Text("Consumption", style: TextStyle(
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    color: _currentIndex == itemIndex ? Colors.white : Colors.grey
                                                )),
                                                Divider(
                                                  color: _currentIndex == itemIndex ? Colors.white : Colors.grey,
                                                  height: 10,
                                                  thickness: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 40,),
                                        Expanded(
                                          flex: 3,
                                            child:Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(devices[itemIndex].Coverage, style: TextStyle(
                                                    fontSize: 14,
                                                    height: 1.6,
                                                    color: _currentIndex == itemIndex ? Colors.white : Colors.black
                                                )),
                                                Text("Coverage", style: TextStyle(
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    color: _currentIndex == itemIndex ? Colors.white : Colors.grey
                                                )),
                                                Divider(
                                                  color: _currentIndex == itemIndex ? Colors.white : Colors.grey,
                                                  height: 10,
                                                  thickness: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                ),
                                              ],
                                            ),
                                          )
                                        )

                                      ],
                                    )
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(devices[itemIndex].Asset_added, style: TextStyle(
                                          fontSize: 14,
                                          height: 1.6,
                                          color: _currentIndex == itemIndex ? Colors.white : Colors.black
                                      )),
                                      Text("Asset added", style: TextStyle(
                                          fontSize: 12,
                                          height: 1.6,
                                          color: _currentIndex == itemIndex ? Colors.white : Colors.grey
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.75,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                ),
                DotsIndicator(
                  dotsCount: devices.length,
                  position: _currentIndex.toDouble(),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, bottom: 24),
                    child: SwitchExample()
                ),
                buildCustomButton(
                    "assets/images/calendar-clock.png", "Set Schedule",
                    "Set your schedule", () => Get.toNamed(AppLinks.setSchedulescreen.path)),
                buildCustomButton("assets/images/play.png", "Start Cleaning",
                    "Start cleaning directly", () => Get.toNamed(AppLinks.startCleaning.path)),
                buildCustomButton(
                    "assets/images/view.png", "View Solar Screening",
                    "View solar screening after every 30 minutes", () => Get.toNamed(AppLinks.solarScreening.path)),
                buildCustomButton(
                    "assets/images/bar-chart-big.png", "Statistics",
                    "Proper daily statistics", () => Get.toNamed(AppLinks.statistics.path)),
              ],
              )
            )
        )
      )
    );
  }

  Widget buildCustomAdd(){
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Your Devices", style: TextStyle(
            fontSize: 20,
            height: 1.6
          )),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: ()=>null,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon( // <-- Icon
                Icons.add,
                color: Color(0xFF8996C5),
                size: 24,
              ),
              label: Text('Add', style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8996C5),
                  height: 1.6
              ),
              ),// - Text
            ),
          )
        ],
      ),
    );
  }

  Widget buildCustomButton(String imagePath, String title, String text,
      Function()? onTap) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(14),
        ),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        padding: EdgeInsets.all(20),
        child: InkWell(
          onTap: onTap,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/Ikona.png', width: 40, height: 40,),
                        Image.asset(imagePath, width: 20, height: 20),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.6)),
                        Text(text, style: TextStyle(
                            fontSize: 12, color: Colors.grey, height: 1.5)),
                      ]
                  ),
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            child: Image.asset(
                            "assets/images/arrow-right.png",
                            width: 24,
                            height: 24,
                          )

                        )
                    )
                )

              ]
          ),
        )

    );
  }
}
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: EdgeInsets.only(left: 6, top: 10),
            child: Text("Auto", style: TextStyle(
            color: Color(0xFFA9A9A9)
          ),)),
          Row(
              children:[
                Container(
                  width: 89,
                  height: 34,
                  child: FlutterSwitch(
                    // This bool value toggles the switch.
                    value: light,
                    width: 89,
                    activeColor: Color(0xFF5062A0),
                    inactiveColor: Color(0xFFE8E8E8),
                    onToggle: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        light = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10,),
                Text("Manual", style: TextStyle(
                    color: Color(0xFFA9A9A9)
                ))
              ]

          )
        ]
    );
  }

}

