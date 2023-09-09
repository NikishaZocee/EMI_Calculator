import 'package:flutter/material.dart';
import "dart:math";
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);

  // this widget is the root of the application
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}): super(key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: TweenAnimationBuilder(
              tween: Tween(
                begin: 0.0,
                end: 1.0,
              ),
              duration: Duration(seconds: 7),
              builder: (context, value, child){
                return Container(
                    color: Color.fromRGBO(219, 111, 149, 100),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Stack(
                          children: [
                            ShaderMask(shaderCallback: (rect){
                              return SweepGradient(
                                startAngle: 0.0,
                                endAngle: 3.14*2,
                                stops: [value, value],
                                center: Alignment.center,
                                colors: [Colors.red, Colors.white],

                              ).createShader(rect);
                            },
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(219, 111, 149, 100)
                                ),
                              ),
                            )
                          ],
                        ),),
                    )
                );
              },
            )
        )
    );
  }
}