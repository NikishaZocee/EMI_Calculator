import 'package:ding/Intro.dart';
import 'package:ding/graph.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lottie/lottie.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Intro(), //yo garesi home batai intro run hunchha
    );
  }
}

class homePage extends StatefulWidget{
  const homePage({Key? key}): super(key:key);

  @override
  State<homePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<homePage> {
bool inyears = true;
String result= "";


double principal = 0;
double interestRate = 0.0;
double tenureInMonths = 0;

TextEditingController principalController = TextEditingController();
TextEditingController interestRateController = TextEditingController();
TextEditingController tenureController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromRGBO(220, 190, 190, 50),
            child: Stack(
              children: [
                Image.asset("assets/Images/Moon♡.jpg"),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(Icons.menu, color: Colors.white,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(Icons.download, color: Colors.white,),
                          )
                        ],
                      ),

                      SizedBox(height: 30),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,

                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 270,
                                width: 240,


                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Icon(Icons.circle)),
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.circle_outlined)),
                                    Positioned(
                                      top: 80,
                                      left: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          "Enter principal amount", style: TextStyle( color: Colors.black, fontWeight: FontWeight.w400
                                            , fontSize: 14
                                        ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top:120,
                                        left: 34,
                                        child: Text(principal.toStringAsFixed(0),
                                          style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold ),
                                        )
                                    ),
                                    Positioned(
                                      top: 200,
                                      left: 40,
                                      child: Text("Principal",
                                        style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(149,186,199, 10),
                                  borderRadius: BorderRadius.circular(40)
                                ) ,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 270,
                                width: 240,

                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Icon(Icons.circle)),
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.circle_outlined)),
                                    Positioned(
                                      top: 80,
                                      left: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          "Enter Interest Rate", style: TextStyle( color: Colors.black, fontWeight: FontWeight.w400
                                            , fontSize: 14
                                        ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top:120,
                                        left: 44,
                                        child: Text(interestRate.toStringAsFixed(1) + "%",
                                          style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold ),
                                        )
                                    ),
                                    Positioned(
                                      top: 200,
                                      left: 50,
                                      child: Text("Interest Rate",
                                        style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.tealAccent,
                                  borderRadius: BorderRadius.circular(40)
                                ) ,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 270,
                                width: 240,
                                child: Stack(
                                  children: [

                                    Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Icon(Icons.circle)),
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.circle_outlined)),

                                    Positioned(
                                      top: 80,
                                      left: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          "Enter Tenure", style: TextStyle( color: Colors.black, fontWeight: FontWeight.w400
                                            , fontSize: 14
                                        ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top:120,
                                        left: 50,
                                        child: Text(tenureInMonths.toStringAsFixed(0),
                                          style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold ),
                                        )
                                    ),
                                    Positioned(
                                      top: 200,
                                      left: 60,
                                      child: Text("Tenure",
                                        style: TextStyle(
                                            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Positioned(
                                      top: 130,
                                      right: 25,
                                      child: Switch(
                                        value: inyears,
                                        onChanged: (newValue) {
                                          setState(() {
                                            inyears = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(149,186,199, 1),
                                  borderRadius: BorderRadius.circular(40)
                                ) ,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), color: Color.fromRGBO(99, 111,121, 100)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(Icons.monetization_on_outlined, color: Colors.black,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),

                                    child: Text("Principal Amount",

                                      style: TextStyle( color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                                  ),
                                ],
                              ),
                              Slider(value: principal,
                                  min: 0,
                                  max: 100000000,
                                  divisions: 100,
                                  label: principal.toStringAsFixed(0),
                                  onChanged: (value){
                                    setState(() {
                                      principal=value;
                                    });
                                  }
                              )
                            ],
                          ),


                          height: 100,
                          width: 400,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(Icons.percent_rounded, color: Colors.black,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Interest Rate",
                                      style: TextStyle( color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                                  ),
                                ],
                              ),
                              Slider(value: interestRate,
                                  min: 0,
                                  max: 20,
                                  divisions: 40,


                                  label: interestRate.toStringAsFixed(1),
                                  onChanged: (value){
                                    setState(() {
                                      interestRate=value;
                                    });
                                  }
                              )
                            ],
                          ),


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), color: Color.fromRGBO(99, 111,121, 100)
                          ),
                          height: 100,
                          width: 400,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:10),
                                    child: Icon(Icons.calendar_month_rounded, color: Colors.black,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Tenure",
                                      style: TextStyle( color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                                  ),
                                ],
                              ),
                              Slider(value: tenureInMonths,
                                  min: 0,
                                  max: 120,
                                  divisions: 120,
                                  label: tenureInMonths.toStringAsFixed(0),
                                  onChanged: (value){
                                    setState(() {
                                      tenureInMonths=value;
                                    });
                                  }
                              )
                            ],
                          ),


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), color: Color.fromRGBO(99, 111,121, 100),
                          ),
                          height: 100,
                          width: 400,
                        ),
                      ),


                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,

                  child: InkWell(
                    onTap: (){
                      double A = 0.0;
                      double P = principal;
                      double r = interestRate / 12 / 100;
                      double n = tenureInMonths;

                      A = (P * r * pow((1+r), n) / ( pow((1+r),n) -1));
                      result = A.toStringAsFixed(2);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Graph(result.toString())));


                      },


                    //button
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Center(child: Lottie.asset("assets/anim/calculate.json")
                      ),

                    ),
                  ),
                )
              ],
            )
          ),
        ),
    );

  }


}
