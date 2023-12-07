import 'package:ding/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Graph extends StatelessWidget {

  String data = "";
  Color weekColor = Colors.black ;
  Color monthColor = Colors.black;
  Color yearColor = Colors.black;
  Color wColor = Colors.white;
  Color mColor = Colors.white;
  Color yColor = Colors.white;
  var result;
  Graph(this.result);

  void _setButtonColors(String selectedButton) {
    setState(() {
      if (selectedButton == "Week") {
        weekColor = Colors.white;
        monthColor = Colors.black;
        yearColor = Colors.black;
        wColor = Colors.black;
        yColor = Colors.white;
        mColor = Colors.white;
      } else if (selectedButton == "Month") {
        weekColor = Colors.black;
        monthColor = Colors.white;
        yearColor = Colors.black;
        mColor = Colors.black;
        yColor= Colors.white;
        wColor= Colors.white;
      } else if (selectedButton == "Year") {
        weekColor = Colors.black;
        monthColor = Colors.black;
        yearColor = Colors.white;
        yColor= Colors.black;
        mColor= Colors.white;
        wColor= Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black87,
          child: Stack(
            children: [
              Image.asset("assets/Images/Moon♡.jpg"),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Icon(Icons.arrow_back_outlined,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text("Dashboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () {
                                _setButtonColors("Week");
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Week",
                                    style: TextStyle(
                                      color: wColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: weekColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () {
                                _setButtonColors("Month");
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Month",
                                    style: TextStyle(
                                      color: mColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: monthColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () {
                                _setButtonColors("Year");
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Year",
                                    style: TextStyle(
                                      color: yColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: yearColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 300,
                    width: 395,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 130,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 80,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 150,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 129,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 220,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 180,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 50,
                right: 70,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child:  Lottie.asset("assets/anim/lines.json")
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
