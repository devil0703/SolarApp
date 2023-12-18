import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';
class statusscreen extends StatefulWidget {
  final String photo;
  final String time;
  statusscreen({super.key, required this.photo, required this.time});

  @override
  State<statusscreen> createState() => _statusscreenState(this.photo, this.time);
}
class _statusscreenState extends State<statusscreen> {
  late String photo, time;
  String btnType="";
  _statusscreenState(String photo, String time){
    this.photo = photo;
    this.time = time;
  }
  void onTap(String msg){
    setState(() {
      btnType = msg;
    });
  }
  Widget buttonWidget(String btnType){
    return Container(
      width: 300,
      height: 50,
      padding: EdgeInsets.only(left: 30),
      margin: EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: btnType==this.btnType?Color(0xFF5062A0):Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Color(0xFF5062A0),
          width: 1,
        )
      ),
      child: InkWell(
          onTap: ()=>onTap(btnType),
          child:
          Align(
            alignment: Alignment.centerLeft,
            child: Text(btnType, style: TextStyle(
                color: btnType==this.btnType?Colors.white:Colors.black,
                fontSize: 20,
                height: 1.16
            )),
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
                            child: Text("Status", style: TextStyle(
                                fontSize: 30,
                                height: 1.2,
                                color: Colors.black
                            ),)
                        )
                      ] ,
                    )
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Image.asset(photo, width: 355, height: 379, fit: BoxFit.cover,),
                      )

                    ],
                  ),
                ),
                buttonWidget("Clean"),
                buttonWidget("Dirty"),
                buttonWidget("Dusty"),
                buttonWidget("Stains"),
              ]
          ),
        )

    );
  }

}
