import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/ui/statusscreen.dart';

import '../utils/config.dart';
class solarScreening extends StatefulWidget {
  const solarScreening({super.key});

  @override
  State<solarScreening> createState() => _solarScreeningState();
}
class SolarScreen{
  late String photo;
  late String time;
  SolarScreen(String _photo, String _time){
    photo = _photo;
    time = _time;
  }
}

class _solarScreeningState extends State<solarScreening> {
  bool _is24Collapsed = true;
  bool _is12Collapsed = true;
  bool _is1Collapsed = false;

  void toggleCollapse24() {
    setState(() {
      _is24Collapsed = !_is24Collapsed;
      _is12Collapsed = _is12Collapsed? _is12Collapsed: !_is12Collapsed;
      _is1Collapsed = _is1Collapsed? _is1Collapsed: !_is1Collapsed;
    });
  }
  void toggleCollapse12() {
    setState(() {
      _is12Collapsed = !_is12Collapsed;
      _is24Collapsed = _is24Collapsed? _is24Collapsed: !_is24Collapsed;
      _is1Collapsed = _is1Collapsed? _is1Collapsed: !_is1Collapsed;
    });
  }
  void toggleCollapse45() {
    setState(() {
      _is1Collapsed = !_is1Collapsed;
      _is12Collapsed = _is12Collapsed? _is12Collapsed: !_is12Collapsed;
      _is24Collapsed = _is24Collapsed? _is24Collapsed: !_is24Collapsed;
    });
  }
  void onTap(SolarScreen solarScreen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => statusscreen(photo: solarScreen.photo, time: solarScreen.time)),
    );
  }
  @override
  Widget build(BuildContext context) {
    List<SolarScreen> solarScreens24 = [];
    List<SolarScreen> solarScreens12 = [];
    List<SolarScreen> solarScreens1 = [];
    //24hours
    SolarScreen solar11 = SolarScreen('assets/images/image17.png', '24 hours ago');
    SolarScreen solar12 = SolarScreen('assets/images/image18.png', '24 hours ago');
    SolarScreen solar13 = SolarScreen('assets/images/image19.png', '24 hours ago');
    SolarScreen solar14 = SolarScreen('assets/images/image20.png', '24 hours ago');
    SolarScreen solar15 = SolarScreen('assets/images/image23.png', '24 hours ago');
    SolarScreen solar16 = SolarScreen('assets/images/image24.png', '24 hours ago');
    //12 hours
    SolarScreen solar21 = SolarScreen('assets/images/image17.png', '12 hours ago');
    SolarScreen solar22 = SolarScreen('assets/images/image18.png', '12 hours ago');
    SolarScreen solar23 = SolarScreen('assets/images/image19.png', '12 hours ago');
    SolarScreen solar24 = SolarScreen('assets/images/image20.png', '12 hours ago');
    SolarScreen solar25 = SolarScreen('assets/images/image23.png', '12 hours ago');
    SolarScreen solar26 = SolarScreen('assets/images/image24.png', '12 hours ago');
    //1 hours ago
    SolarScreen solar31 = SolarScreen('assets/images/image17.png', '1 hours ago');
    SolarScreen solar32 = SolarScreen('assets/images/image18.png', '1 hours ago');
    SolarScreen solar33 = SolarScreen('assets/images/image19.png', '1 hours ago');
    SolarScreen solar34 = SolarScreen('assets/images/image20.png', '1 hours ago');
    SolarScreen solar35 = SolarScreen('assets/images/image23.png', '1 hours ago');
    SolarScreen solar36 = SolarScreen('assets/images/image24.png', '1 hours ago');

    solarScreens24.add(solar11);
    solarScreens24.add(solar12);
    solarScreens24.add(solar13);
    solarScreens24.add(solar14);
    solarScreens24.add(solar15);
    solarScreens24.add(solar16);

    solarScreens12.add(solar21);
    solarScreens12.add(solar22);
    solarScreens12.add(solar23);
    solarScreens12.add(solar24);
    solarScreens12.add(solar25);
    solarScreens12.add(solar26);

    solarScreens1.add(solar31);
    solarScreens1.add(solar32);
    solarScreens1.add(solar33);
    solarScreens1.add(solar34);
    solarScreens1.add(solar35);
    solarScreens1.add(solar36);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/first.png"),
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
                          child: Text("Solar Screening", style: TextStyle(
                              fontSize: 30,
                              height: 1.2,
                              color: Colors.black
                          ),)
                      )
                    ] ,
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 40),
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
                              backgroundColor: _is24Collapsed? MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)) : MaterialStateProperty.all<Color>(Color(0xFF5062A0))
                          ),
                          onPressed: toggleCollapse24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('24 Hours',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.6,
                                    color: _is24Collapsed? Colors.black : Colors.white
                                ),
                              ),
                              _is24Collapsed? Icon(Icons.arrow_right,color: Colors.black):Icon(Icons.arrow_drop_down,color: Colors.white)
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(top: 10), child: AnimatedContainer(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          duration: Duration(milliseconds: 300), // Animation duration
                          curve: Curves.easeInOut, // Animation curve
                          width: 332,
                          height: _is24Collapsed ? 0 : 474, // Toggle the height
                          child: Center(
                            child: GridView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: solarScreens24.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12
                              ),
                              itemBuilder: (BuildContext context, int index){
                                return buildCustomImage(solarScreens24[index]);
                              },
                            ),
                          )
                      ),)

                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
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
                                backgroundColor: _is12Collapsed? MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)) : MaterialStateProperty.all<Color>(Color(0xFF5062A0))
                            ),
                            onPressed: toggleCollapse12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('12 Hours',
                                  style: TextStyle(
                                      fontSize: 20,
                                      height: 1.6,
                                      color: _is12Collapsed? Colors.black : Colors.white
                                  ),
                                ),// Adjust the space between text and icon
                                _is12Collapsed? Icon(Icons.arrow_right,color: Colors.black):Icon(Icons.arrow_drop_down,color: Colors.white)
                              ],
                            )
                        ),
                        Padding(padding: EdgeInsets.only(top: 10),
                          child: AnimatedContainer(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            duration: Duration(milliseconds: 300), // Animation duration
                            curve: Curves.easeInOut, // Animation curve
                            width: 332,
                            height: _is12Collapsed ? 0 : 480, // Toggle the height
                              child: GridView.builder(padding: EdgeInsets.all(0),
                                itemCount: solarScreens12.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12
                                ),
                                itemBuilder: (BuildContext context, int index){
                                  return buildCustomImage(solarScreens12[index]);
                                },
                              ),
                        ),)
                      ]
                  )
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
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
                            backgroundColor: _is1Collapsed? MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)) : MaterialStateProperty.all<Color>(Color(0xFF5062A0))
                        ),
                        onPressed: toggleCollapse45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1 Hours',
                              style: TextStyle(
                                  fontSize: 20,
                                  height: 1.6,
                                  color: _is1Collapsed? Colors.black : Colors.white
                              ),
                            ), // Adjust the space between text and icon
                            _is1Collapsed? Icon(Icons.arrow_right,color: Colors.black):Icon(Icons.arrow_drop_down,color: Colors.white)
                          ],
                        )
                    ),
                    Padding(padding: EdgeInsets.only(top: 10), child: AnimatedContainer(
                      padding: EdgeInsets.only(top: 20),
                        duration: Duration(milliseconds: 300), // Animation duration
                        curve: Curves.easeInOut, // Animation curve
                        width: 332,
                        height: _is1Collapsed ? 0 : 474, // Toggle the height
                        child: Center(
                          child: GridView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: solarScreens1.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12
                            ),
                            itemBuilder: (BuildContext context, int index){
                              return buildCustomImage(solarScreens1[index]);
                            },
                          ),
                        )
                    ),)

                  ],
                ),
              )
            ]
        ),
      )

    );
  }
  Widget buildCustomImage(SolarScreen solaritem) {
    return Container(
        width: 155,
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.transparent
        ),
        // margin: EdgeInsets.only(left: 20, right: 20, bottom: 16)
        child: InkWell(
          onTap: () => onTap(solaritem),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              // color: Colors.transparent,
              image: DecorationImage (
                image: ExactAssetImage(solaritem.photo),
                  fit: BoxFit.cover
              ),
            ),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
                  child: Text(solaritem.time, style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                  ),),
                )
            )
          )

          ),
    );
  }
}


