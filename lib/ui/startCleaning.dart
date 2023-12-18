import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';
class startCleaning extends StatefulWidget {
  const startCleaning({super.key});

  @override
  State<startCleaning> createState() => _startCleaningState();
}

class _startCleaningState extends State<startCleaning> {
  void onCleaning(){
    print("Start Cleaning");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/third.png"),
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
                          alignment: AlignmentDirectional.centerStart,
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
                          child: Text("Start Cleaning", style: TextStyle(
                              fontSize: 30,
                              height: 1.2,
                              color: Colors.black
                          ),)
                      ),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: ()=>print("Hello"),
                                child: Image.asset(
                                  'assets/images/refresh.png',
                                  width: 24,
                                  height: 24,
                                ),
                              )
                          )
                      ),
                    ] ,
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 161),
                child: InkWell(
                  onTap: onCleaning,
                  child: Image.asset(
                    'assets/images/Cleaning.png',
                    width: 255,
                    height: 255,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 45, left: 45),
                child: Text(
                  "Starting Time",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 45, left: 45, top: 11),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFF898989),
                      width: 1,
                    ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "00:00:00",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.black
                    ),
                  ),
                )
              )

            ]
        )
    )
    );
  }
}
