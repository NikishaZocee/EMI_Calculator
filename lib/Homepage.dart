import 'package:flutter/material.dart';

import 'data/barGraph.dart';

class home extends StatefulWidget{
  const home({super.key});

  @override
  State<home> createState()=>_homeState();
}

class _homeState extends State<home>{

  //creating a list full of data that will be used in the barchart.

  List<double> weeklySummery=[
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: double.infinity,
          child: MyBarGraph(weeklySummary: [],

          ),
        ),
      ),
    );
  }
}